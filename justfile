serve:
    hugo server --buildDrafts

serve-full:
    hugo server --buildDrafts --disableFastRender

new name:
    hugo new content post/{{ name }}.md

minify:
    hugo --minify --environment development
