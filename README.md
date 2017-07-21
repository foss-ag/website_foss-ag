# FOSS-AG Website
This repository contains all the stuff from which foss-ag.de is generated. The website (HTML files) isn't included here, but got an extra repository (soon).

## Contents
1. [Preparations](#preparations)
2. [How to add posts](#how-to-add-posts)
3. [How to add sites to the sidebar navigation](#how-to-add-sites-to-the-sidebar-navigation)
4. [How to edit next meetings section](#how-to-edit-next-meetings-section)
5. [How to add protocols](#how-to-add-protocols)

## Preparations
- First of all [install Hugo](https://gohugo.io/overview/installing/)
- Check if you have installed the latest version of Hugo (v0.25.1)
```
hugo version
```

- Then clone this repository
```
git clone https://git.foss-ag.de/FOSS-AG/website_foss-ag.git
```

- Change directory to cloned git repository
```
cd website_foss-ag
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

- Test if everything works by generating the website. Note that no drafts will be shown. To show draft add the `-D` option.
```
hugo server --theme=hugo-creative-portfolio-theme
```
Alternatively use the `Makefile` with
```
make
```
Drafts will be shown automatically.

- Open your web browser and visit `http://localhost:1313/`. There you should see the generated website.

## How to add posts
To create a new post use the following command:
```
hugo new portfolio/name_of_your_post.md
```
The Markdown file representing the post will appear in `/content/portfolio/`. Here you will find a header with information such as title and date. Below the header you can write the actual content.

If you want to add a preview image to your post you can add a line `image: "img/your_image.png"` to the header. The corresponding image must be saved in `/static/img`. Furthermore you can decide if the preview image shall be shown with or without a small preview of the text. Therefore add another line to the header: `showonlyimage: true`

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

## How to add sites to the sidebar navigation
If you want to add a new site to new sidebar navigation you must follow these two simple steps.

- First, create a new content entry. It's necessesary to name the file `index.md` otherwise the theme won't recognise it.
```
hugo new name_of_your_site/index.md
```

- Second, add the new site to the sidebar navigation, therefore edit the `config.toml` file in the projects root directory. Just add the following lines to the config file.

```
[[params.navlinks]]
name = "name_to_display_in_the_sidebar_navigation"
url = "name_of_your_site"
```

Don't forget to build the website. See "[How to add posts](#how-to-add-posts)".

## How to edit next meetings section
To add information for the next meetings to the website, open the `config.toml` file, which can be found in the repositorys root directory.
There you find `sidebarAbout` parameter. Here you can simply replace the old information by the new ones.
Some hints on editing the `sidebarAbout` parameter:

- The theme won't acccept the `sidebarAbout` parameter, if you use line break. You have to write everything in a single line.
- To add line breaks in your text use the `<br>` HTML tag.

Don't forget to build the website. See "[How to add posts](#how-to-add-posts)".

## How to add protocols
Each protocol needs to be in a seperate directory. To create a new protocol file and the corresponding directory use
```
hugo new /protocols/number_of_protocol/number_of_protocol.md
```

The `number_of_protocol.md` (e.g. `42.md`) contains the actual protocol. Adding it to the list of protocols is as simple as inserting a new line to the `protocols/index.md` file like this:
```
- [Sitzung number_of_protocol - date_of_meeting](number_of_protocol)
```

Don't forget to build the website. See "[How to add posts](#how-to-add-posts)".
