serve:
    hugo server -D

new name:
    hugo new content post/{{ name }}.md

minify:
    hugo --minify --environment development
