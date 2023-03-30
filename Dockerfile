FROM rockylinux/rockylinux:9 AS buildbox

#  129294d is the release build for 0.8.3
ENV COMMIT_HASH="129264d"

RUN dnf install -y 'dnf-command(config-manager)' \
	&& dnf -y config-manager --set-enabled crb \
	&& dnf install -y ninja-build libtool cmake gcc gcc-c++ \
			make pkgconfig unzip gettext curl-minimal git \
	&& git clone https://github.com/neovim/neovim.git /usr/local/src/neovim \
	&& cd /usr/local/src/neovim \
	&& git checkout $COMMIT_HASH \
	&& make CMAKE_BUILD_TYPE=RelWithDebInfo \
	&& ls -l 
	


FROM rockylinux/rockylinux:9
LABEL version="v0.0.7"
COPY --from=buildbox /usr/local/src/neovim/build/bin/nvim /bin/
COPY --from=buildbox /usr/local/src/neovim/runtime /usr/local/share/nvim
RUN dnf install -y zsh git \
	&& useradd -ms /bin/zsh o0zi \
	&& mkdir -p /home/o0zi/.config/nvim/ \
	&& curl -fLo /usr/local/share/nvim/autoload/plug.vim \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
 	&& dnf clean all \
  	&& rm -rf /var/cache/yum \
	&& printf '%s\n' "autoload -Uz vcs_info" "precmd() { vcs_info }" \
	"zstyle ':vcs_info:git:*' formats '%b '" "setopt PROMPT_SUBST" \
	"PROMPT='%F{green}%*%f %F{blue}%~%f %F{red}${vcs_info_msg_0_}%f$ '" \
	>> /home/o0zi/.zshrc
ADD --chown=o0zi:o0zi init.vim /home/o0zi/.config/nvim/
USER o0zi
WORKDIR /src
RUN  nvim -Es -u "/home/o0zi/.config/nvim/init.vim" +PlugInstall +qall || true
CMD  ["nvim"]

