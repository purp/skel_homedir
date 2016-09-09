github_clone() {
    git clone git@github.com:purp/$1.git
}
alias ghcl=github_clone

update_blog_from_jekyll() {
    cd ~/work/blog.geekdaily.org
    rsync -avzh _site/ ../geekdaily.github.io/
    cd -
}

build_blog_for_production() {
    cd ~/work/blog.geekdaily.org
    JEKYLL_ENV=production jekyll build
    cd -
}

build_and_update_blog() {
    build_blog_for_production
    update_blog_from_jekyll
}

mcdiff() {
    opendiff ~/work/mc-world-backups/$1 ~/work/mcpro/$1
}
