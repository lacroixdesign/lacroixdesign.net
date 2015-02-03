---
title: "Always Have a Solid Backup Plan"
tagline: "How we are leveraging cloud services to keep all of our design and development files backed up."
date: "2015-02-03 7:00"
author: "James LaCroix"
published: true
image: "always-have-a-solid-backup-plan.jpg"
inline_header: true
above_header: true
---

This past autumn, I once again had the opportunity to work with long-time friends and clients, [Relient K](http://relientk.com) designing and producing merchandise for their upcoming tour. Celebrating the 10-year anniversary of their best-selling album, [MMHMM](http://en.wikipedia.org/wiki/Mmhmm), the tour was slated to be a special event for both the band and their fans.

In addition to newly designed merchandise, the members of Relient K wanted to reprint classic merchandise from the timeframe of their original record release. This led me to an exploration of art files from 10 years back. Many of these files predated LaCroix Design Co. and I was amazed to find that I had retained so many of the design files and records from this time. We were successfully able to manufacture the classic apparel and the tour was a huge success.

Since starting LaCroix Design Co. in 2005, we have been victims of a burglary and numerous hard drive failures. The fact that I had retained a collection of files from ten years back was more of a testament to luck than any full-proof backup plan. However, we’ve never been content leaving this up to luck alone.

From the beginning, we have made deliberate decisions to ensure that work we create for our clients is systematically backed up and available for years to come. This is an overview of the redundant system we are using to keep all our files safe.

### System Wide

Our backup plan starts with individual computers. This ensures everything on our systems is accessible at any given time. Should we experience a system malfunction, hard drive failure, theft or some other disaster, these backups are available to help us get up and running quickly. These system solutions work in tandem with the other services we outline to provide redundancy.  

#### Time Machine

We start with [Time Machine](http://support.apple.com/en-us/HT201250), the built-in backup feature of OS X. This feature retains a copy of our of our files, as well as a feature that expresses how our system looked on any given day. These backups are synced via our wireless network and stored on two separate hard drives.

#### Backblaze

Time Machine is a terrific feature, but it is backing up the files to disks which reside at the same physical location as our computers. Thus, we require something that will allow us to backup the bulk of our files to remote storage.

This is where [Backblaze](http://lcrx.co/1vplTMd) excels. For $50 a year, Backblaze will continuously backup an unlimited amount of data from you computer and any drives attached to it. This provides us access to multiple versions of our files through its online interface. Or, we may request the shipment of a hard drive with all of our data on it.

Although this backup process is not a fast as a locally attached device or Time Machine running on our local network, Backblaze provides us with a sound piece of mind knowing that our files are continuously being backed up off-site.

### Design Files

We find it important to create an additional level of backup for our design files. Very often, these files can be quite large and a loss of the editable versions would require an inordinate amount of time to recreate.

#### LayerVault

For many years, we stored all of our working design files on Dropbox so that we could access them from anywhere. We have since replaced this with one of my most relied-upon online services, [LayerVault](https://layervault.com/r/3X2).

LayerVault provides remote version control for all of our art files and a slew of other vital features. Years ago, we attempted to version-control our design files using Git, which resulted in oversized repositories. Thus, we were thrilled to discover that LayerVault offered this crucial service and provided file previews for each version. We no longer have to save versions of a file out as final-1, final-2, etc.

In addition to automatically versioning all of our design files, LayerVault allows us to share project files internally or with an external team. As a result, others involved in a project will always have access to the latest design files and assets.

Furthermore, LayerVault retains all of our project files and allows us to leave and rejoin a project at any time. Thus, we are able to remove a folder of project files from our computer and rejoin the project at a later date. Doing so will, in turn, sync all of the design files for a project back to our computer.

#### Vault Drive

As an added layer of backup, I keep a large hard drive of every LaCroix Design Co. project connected to my computer. As projects are completed, they are organized in folders by year. Additionally, font files and other assets are regularly archived on this drive. Since the drive is attached to my system, it is also backed up using Backblaze. While I imagine that this drive may one day be replaced by [Amazon Glacier](http://aws.amazon.com/glacier/) or something similar, but this current setup has been working out very well.

### Development Files
As our design process evolved from building static designs in traditional design applications to a process of iterating, prototyping and building interactive experiences with code, versioning and keeping backups of development files has become immensely important.

#### Repositories

All of our development projects are version-controlled using [Git](http://git-scm.com/). We host the majority of these repositories publicly and privately on [GitHub](http://github.com) and utilize [Bitbucket](https://bitbucket.org/) to host repositories for our smaller projects that we wish to keep private.

### Documents & Meeting Notes
Documents for all projects are stored on [Google Drive](https://www.google.com/drive/) and also archived along with all design files onto our Vault Drive upon the completion of each project. [Evernote](http://lcrx.co/1DylAxU) is used to record all meeting notes, which are then shared internally.

If it is not obvious by now, our backup process is very important to us. Being able to provide files and assets years after a project is over allows us to continually exceed the expectations of the clients that partner with us. Feel free to [comment on Twitter](https://twitter.com/lacroixdesign) if you have any questions or need clarity as to how we are using these tools and services.
