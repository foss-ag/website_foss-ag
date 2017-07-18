# FOSS-AG Website
This repository contains all the stuff from which foss-ag.de is generated. The website (HTML files) isn't included here, but got an extra repository (soon).

## Preparations
- First of all [install Hugo](https://gohugo.io/overview/installing/)
- Check if you have installed the latest version of Hugo (v0.24.1)
```
hugo version
```

- Then clone this repository
```
git clone https://git.foss-ag.de/FOSS_AG/foss_ag_website.git
```

- Change directory to cloned git repository
```
cd foss_ag_website
```

- Make sure to initialise the theme submodule
```
cd themes/hugo-creative-portfolio-theme
git submodule update --init --recursive
```

- Go back to the root of the repository and clone the public foss-ag repository into it. Then rename the directory to public.
- ** Note: There isn't a public repo yet. Skip this one for now **
```
cd ../..
git clone LINK_TO_PUBLIC_REPO
mv PUBLIC_REPO public
```

- Test if everything works by generating the website
```
hugo server --theme=hugo-creative-portfolio-theme
```

- Open your web browser and visit `http://localhost:1313/`. There you should see the generated website.

## How to add posts
To create a new post use the following command:
```
hugo new portfolio/name_of_your_post.md
```
The Markdown file representing the post will appear in `/content/portfolio/`. Here you will find a header with information such as title and date. Below the header you can write the actual content.

To check if everything looks the way you want it to be start a server on localhost using:

```
hugo server --theme=hugo-creative-portfolio-theme -D
```

As you might have noticed there is a draft flag in your post header. As long as it's set to true Hugo won't consider this file unless you add the `-D` flag, which stands for `buildDrafts`. If everything is alright you can undraft your post using:

```
hugo undraft /portfolio/name_of_your_post.md
```

Now build the website:

```
hugo --theme=hugo-creative-portfolio-theme
```

You will find the website in the `public/` directory. As mentioned above the `public/` directory is a git repository, so you want to commit the new version.

Last but not least: Don't forget to pull the new version on the server that hosts the website, otherwise the changes won't be published.

Done! You've added a new post to foss-ag.de. Conlaturations!
