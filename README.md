# Blueprint of an Enterprise Rails Application

When we talk about selecting technology stack for building enterprise applications, Ruby/Rails does not come to mind. Most common answer is Java.
And there is a good reason for it. Most established enterprises have gone through a painful transition from proprietary technologies from IBM,
Digital and others to Java and related open-source stacks (LAMP, Apache, etc.).

New enterprise software by giants such as Google, Twitter, GroupOn are not built on Java. They use newer languages like Python, Ruby, JavaScript
, Scala and open source frameworks such as DJango, PHPCake and Ruby-On-Rails, Akka, etc.

Over the past few years, Ruby-On-Rails has gain significant traction among young start-ups and traditional corporate IT departments
to a smaller extent.

### Can Ruby/Rails be used for building large scale enterprise applications?

I recently worked on a client project that involved creating an architecture/infrastructure for developing an enterprise
application on Rails framework. Refer to the WIKI page for a detailed discussion on the architecture.  Many mistakes were made and
many lessons were learned while working on this project.

This open-source project aims to extract those learnings and past experiences into creating a reusable blueprint for
developing enterprise applications on Rails platform.

- Modular plug-in architecture
- Clear separation of concerns
- Use of Rails best practices and idioms
- Fully integrated read-to-use sample application


### What is Enterprise Application?

Several characteristics distinguishes Enterprise Application from desktop and SaaS applications. Enterprise applications are
complex, scalable, distributed, component-based, and mission-critical. These applications are critical to businesses for
running day-to-day operations. Think of stock-trading application, airline reservation application.

These applications share common architecture concerns such as following:

- Security
- Privacy
- Data Governance
- High Availability
- Performance
- Interoperability
- Integration
- Compliance
- Provisioning and licensing







