FROM rocker/verse:4.0.1

# system dependencies
RUN export DEBIAN_FRONTEND=noninteractive; apt-get -y update \
  && apt-get install -y gdal-bin=3.0.4+dfsg-1build3 \
	libgdal-dev=3.0.4+dfsg-1build3 \
	libgeos-dev=3.8.0-1build1 \
	libgeos++-dev=3.8.0-1build1 \
	libudunits2-dev=2.2.26-5 \
	make=4.2.1-1.2 \
	pandoc=2.5-3build2 \
	pandoc-citeproc=0.15.0.1-1build4

# 	git=1:2.25.1-1ubuntu3 \

# get R packages
ENV RENV_VERSION 0.11.0-6
RUN R -e "install.packages('remotes', repos = c(CRAN = 'https://cloud.r-project.org'))"
RUN R -e "remotes::install_github('rstudio/renv@${RENV_VERSION}')"

# Restore renv cache
COPY renv.lock renv.lock
RUN Rscript -e 'renv::consent(provided = TRUE)'
RUN R -e 'renv::restore()'

# Install redoxpeat manually ---todo: update this to GitHub repo later on
COPY redoxpeat_0.0.0.9002.tar.gz redoxpeat_0.0.0.9002.tar.gz
RUN R -e "install.packages('./redoxpeat_0.0.0.9002.tar.gz', repos = NULL)"

# working directory name
WORKDIR /home/rstudio

# Install some LaTeX packages (tex compilation with tinytex otherwise results in errors)
RUN tlmgr update --self
RUN tlmgr install xcolor pgf preview mdframed biber colortbl oberdiek mathtools \
	amsmath latex-amsmath-dev textcase dashrule ifmtarg ragged2e \
	preprint soul ec xpatch etoolbox lineno ltxcmds kvsetkeys zref kvdefinekeys \
	etexcmds needspace silence microtype lato fontaxes geometry alphalph intcalc \
	koma-script titlesec footmisc fancyhdr changepage environ trimspaces marginnote \
	quoting enumitem caption threeparttable sttools newfloat enotez translations lettrine \
	minifp siunitx booktabs bigintcalc bitset gettitlestring hycolor hyperref letltxmacro \
	pdfescape refcount rerunfilecheck stringenc uniquecounter zapfding biblatex logreq \
	multirow wrapfig float pdflscape tabu varwidth threeparttablex ulem makecell \
	epstopdf-pkg multibib

# everysel

# labels
LABEL maintainer = "Henning Teickner <henning.teickner@uni-muenster.de>" \
  org.opencontainers.image.authors = "Henning Teickner <henning.teickner@uni-muenster.de>, \
  Chuanyu Gao, Klaus-Holger Knorr" \
  author.orcid = "0000-0002-3993-1182" \
  edu.science.data.group.project = "This Study was funded by the Deutsche Forschungsgemeinschaft \
	(DFG, German Research Foundation) grant no. KN 929/12-1 to Klaus-Holger Knorr; Chuanyu Gao \
	was supported by the Youth Innovation Promotion Association CAS (No. 2020235)." \
  org.opencontainers.image.version = "0.0.0.9001" \
  org.opencontainers.image.licenses = "GPL-3"

# instructions

# to build the image, navigate to the directory with the Dockerfile and run:
# docker build -t redoxpeat:0.0.0.9002 .

# to run the image in a container, do:
# docker run --rm -e PASSWORD=redoxpeat -p 8787:8787 -v $(pwd):/home/rstudio/redoxpeat --user rstudio redoxpeat:0.0.0.9002

# to reproduce the analyses, run (takes about 2 h and occupies additional 11 Gb disk space)
# docker run --rm -v $(pwd):/home/rstudio/redoxpeat redoxpeat:0.0.0.9002 R -e 'setwd("/home/rstudio/redoxpeat"); rmarkdown::render("analysis/paper/001-paper-main.Rmd");'


