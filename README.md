
# Blueprint of SaaS Rails Application


When we talk about selecting technology stack for building large scale SaaS applications, there are many options ranging from Java/J2EE, LAMP,
Python/Django, Ruby-On-Rails, Node.js and many more. You can build your SaaS application using any of these framework.  Among many criteria for
choosing a language or framework are:

Over the past few years, Ruby On Rails has gain significant traction among start-ups because of its highly productive environment and
a natural fit into a fast-paced iterative environment.

- Skill set of your current employees
- Affordability to hire employees/freelancers with requisite skills 
- Your familiarity and perception about a specific language or framework.
- Your past experience working with similar framework

Web is filled with blogs, articles and discussions about pros and cons of each language or framework.  
However, if you are considering Ruby-On-Rails for your next project, you have come to a right place.  

### DISCLAIMER

This open-source project is not for a Rails newbie. It is assumed that you are intimately 
familiar with Ruby programming language and Rails framework. And you have basic understanding of 
DevOps in general and Docker Container technology in particular.

Much like Rails, this is a highly opinionated framework. It prescribes to a set of software philosophies, 
best practices and selected open-source components that are customized and loosely integrated to create
an executable and testable architecture. Primary goal of this project is to give you a jump start for 
your SaaS application by avoiding to repeat the common tasks of building an architecture and related 
services. It is my hope that using this framework will save you a lot of time and resources that you can
focus on building your application.
 

### A reusable, executable architecture for Rails based SaaS application


One of the core principle of Ruby On Rails is DRY, an acronym for Don't Repeat Yourself. The idea behind it is simple: whenever possible, 
re-use as much code as possible rather than duplicating similar code in multiple places. This reduces errors, keeps your code clean and 
enforces the principle of writing code once and then reusing it.
 
And yet, when we start building Rails based SaaS application, we start from base Ruby-On-Rails and add gems, plugins and custom components to create 
the core architecture before we write a single line of business application. For example, every SaaS application needs user authentication 
service, role based authorization, a search engine, content management, caching, data security, job scheduler, so and so forth.

In the spirit of keeping things DRY, we search through the gem repositories, blogs, GitHub projects to find reusable gems, libraries 
and code to meet our architectural specifications. Like any large open-source project, Rails has a very large developer community 
and an eco-system consisting of open-source developers, gems/libraries, tools, blog posts, etc. and plethora of commercially available 
tools, services and XXXX to help build your application. Weeding through these vast pool of resources and picking the right gems/libraries, 
tools is a daunting task. 
 
What if is there an alternative to reuse a pre-built architecture that has been fully integrated, tested and ready for deployment on day one!
Why should every start-up repeat the process of building the core architecture from scratch?  
Why can't we apply the DRY principle for creating a higher level reusable architecture?

This open source project aims to do exactly that. Its goal is to create a reusable (and executable) architecture of a Rails based SaaS
applications that is pre-packaged with code, test suites, documentation and deployment tools for common services and architectural 
components to jump start your application development.  It saves you a lot of time and effort to set-up your engineering infrastructure
(development methodology, tools, best practices, DevOps, etc.) and frees you up to focus on implementing business functionality.
Using this kind of higher level framework can significantly improve the quality of your product and shorten your time to market at the same time. 

Of course, you can add/delete/modify any part of the architecture as you please. Much like Rails, you can follow the prescribed 
conventions OR implement your own for any part of the architecture. 

An Executable Architecture (EAR) is an architectural specification of enterprise software accompanied by production quality code.
The "executable" emphasizes the fact that the architecture can be tested/verified by running the code out-of-the-box.

- Modular plug-in architecture
- Clear separation of concerns
- Use of Rails best practices and idioms
- Fully integrated ready-to-use sample application

For full documentation refer to WIKI page at https://github.com/prakash-alpine/enterprise-rails/wiki
<!---
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

There are well defined guidelines, standards and specifications for implementing these concerns in a traditional enterprise applications.
But when we talk about SaaS applications, these concerns take up a new dimension due public/shared nature of cloud infrastructure. 
And for that reason, they require different solutions. 

This open-source projects aims to address these concerns by implementing them using best practices and thoughtfully researched and tested
gems/libraries and components. 

--->







