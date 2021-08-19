<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]

## Capstone Experiential Network (XN) Project
<!-- PROJECT LOGO -->

<div style="width: auto; text-align: center; text-align: center;">  

<a href="https://www.credly.com/badges/343830b9-a38d-4078-a38b-dbd28807ff78/linked_in" target="_blank"><img src="Images/Creed-_Diplomacy_Lab-01.png" style="max-width: 50%;  
height: auto;"></a>

</div>  

<br />
<p align="center">

  <h3 align="center">Diplomacy Lab Analysis</h3>


  <p align="center">
    This is Final Capstone Experiential Network (XN) Project for ALY6070 - Communication and Visualization for Data Analytics SEC Spring 2021 CPS. <br>It was primarily to introduce and learn Data Analytics and high level preliminary (Exploratory Data Analysis EDA) analysis using RShiney and Tableau.
    <br />This paper summarizes our preliminary EDA analysis on the provided dataset by the US State Government working with the UN. Here we researched and analyzed a specific area of UN internal committee meetings as requested by a U.S Embassy. We produced recommendations and presented our solutions contributing to the formulation of U.S. foreign policy.
    <br />
    <a href="https://github.com/mascarenhasneil/DiplomacyLab-Analysis/blob/main/Readme.md"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://mascarenhasneil.github.io/DiplomacyLab-Analysis/">View Project</a>
    ·
    <a href="https://github.com/mascarenhasneil/DiplomacyLab-Analysis/issues">Report Bug</a>
    ·
    <a href="https://github.com/mascarenhasneil/DiplomacyLab-Analysis/issues">Request Feature</a>
  </p>
</p>



### **Our Paper Presentation Slides**

||||
|-|-|-|
| ![Slide 1](Images/Presentation-Slides/Slide1.PNG?raw=true "Slide 1")|![Slide 2](Images/Presentation-Slides/Slide2.PNG?raw=true "Slide 2")|![Slide 3](Images/Presentation-Slides/Slide3.PNG?raw=true "Slide 3")|
| ![Slide 4](Images/Presentation-Slides/Slide4.PNG?raw=true "Slide 4")|![Slide 5](Images/Presentation-Slides/Slide5.PNG?raw=true "Slide 5")|![Slide 6](Images/Presentation-Slides/Slide6.PNG?raw=true "Slide 6")|
| ![Slide 7](Images/Presentation-Slides/Slide7.PNG?raw=true "Slide 7")|![Slide 8](Images/Presentation-Slides/Slide8.PNG?raw=true "Slide 8")|![Slide 9](Images/Presentation-Slides/Slide9.PNG?raw=true "Slide 9")|
| ![Slide 10](Images/Presentation-Slides/Slide10.PNG?raw=true "Slide 10")|![Slide 11](Images/Presentation-Slides/Slide11.PNG?raw=true "Slide 11")|![Slide 12](Images/Presentation-Slides/Slide12.PNG?raw=true "Slide 12")|
| ![Slide 13](Images/Presentation-Slides/Slide13.PNG?raw=true "Slide 13")|![Slide 14](Images/Presentation-Slides/Slide14.PNG?raw=true "Slide 14")|![Slide 15](Images/Presentation-Slides/Slide15.PNG?raw=true "Slide 15")|
| ![Slide 16](Images/Presentation-Slides/Slide16.PNG?raw=true "Slide 16")|![Slide 17](Images/Presentation-Slides/Slide17.PNG?raw=true "Slide 17")|![Slide 18](Images/Presentation-Slides/Slide18.PNG?raw=true "Slide 18")|
| |![Slide 19](Images/Presentation-Slides/Slide19.PNG?raw=true "Slide 19")||



<p align="justify">
For this research paper, we worked on Diplomacy Lab’s Data Sets. The United Nations Organization had sponsored this dataset and project. As per their guidelines and requirements, we worked on this project. Here we analyzed committee data and understand how the committees and general assembly function will provide insight. We presented the insights and findings using dashboards. Once we understand the data, it was much easier for us to design a dashboard knowing the key variables.

<p align="justify">
First, we reviewed the data set and start looking for valuable information to determine key drivers of the analysis. We analyzed the variables, attributes, and column information. Next, we seeked correlations that complete a preliminary analysis. In our analysis, answered the following questions.


1) Are there any common keywords among several committees? If yes, what are they?

2) Can we determine a pattern with the committee and what was the adopted rate. (Number of votes)?

3) Over several years, what was the transformation with the issues and their resolutions?

4) Over time which committees have a higher number of issues and the keywords for those issues. Is there a significant change?

5) From the Vote Summary, can we understand the pattern of the results from them?

6) If there any common issues discussed among committees? Which ones are they?

7) Find out the issues debated which are mutual to multiple committees? If so, which ones?

8) Keywords associated with issues over time and find out which ones are they?

9) From (191__a) issues that did not go to vote, what are their keywords? Using this information, can we conclude they should have been gone for voting, or was it correct that they did not?

10) For which keywords or issues did we have a higher count of voting? Do these results correlate to the number of people who voted?


<br><br>
<p align="justify">
While we were working with several variables in the dataset. They had their importance and get us more about other variables and features. For the Committee dataset, we had below variables with their description:

||||
|-|-|-|
|ID	|ID|	This stores a unique identification of each entry made on the committee data |
|Code-NV	|191__a	|This feature is the reference codes for drafts and discussion - everything that did not go to a vote|
|Description1	|245__a	|This feature is also called Title Statement.  This field will be empty if a resolution adopted with a vote|
|Date	|992	|Date of Action. Here the action is regarding voting and what decision was made.|
|Vote Summary	|996	|This variable is the vote Note. It stores the results of the voting.|
|NA-committee	|793__a	|This one store the committee’s name.  Generally, draft resolutions are recommended for adoption by the General Assembly committees. They are adopted at plenary meetings of the General Assembly. No committee names are recorded in this tag. It only indicates that a vote took place in a PLENARY MEETING of the General Assembly.|
|Description2	|991__c	|This field stores the information on the agenda |
|Title	|991__d	|This field stores the title of the agenda. It is a short form title|
|Doc History	|993__a	|This variable stores the Documents records and committee IDs. The History and records of the documents used at that time—progression of document from committee to GA.|
|Keywords	|Keywords	|This field stores the Keywords associated with the action. |


## The Audience
<p align="justify">
The audience of the data visualization is the general public. This audience is of all backgrounds and country, locations, and consists of adult people, as per our sponsor’s requirements. The visualization is accessible to all people, and they are in the public domain. This accessibility means these visualizations and data representation is created so that majority (if not all) must read them and understand them.
<p align="justify">
According to the sponsor, below are the initial questions that the audience wants to be answered:

+	What are the top 10 keywords/topics discussed and voted by each committee?
+	Are there any common keywords/topics discussed and voted among committees? If so, which ones?
+	Are there any common agenda among committees?
+	What are the issues/topics/keywords by committees and resolution code?
+	What is the distribution of issues by year? What is the distribution of issues by year for each committee?

</p></p></p></p></p>



<!-- ROADMAP -->
## Roadmap

<p align="justify">
Just to get started, we had business study, once we did it, we analyzed that we can create more insights based on the above data. If anyone has different approach, we can try that as well and come up with visualizations.
</p>


See the [open issues](https://github.com/mascarenhasneil/DiplomacyLab-Analysis/issues) for a list of proposed features (and known issues)



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request



<!-- LICENSE -->
## License

Distributed under the GPL v3 License. See **[LICENSE](https://github.com/mascarenhasneil/DiplomacyLab-Analysis/blob/main/LICENSE)** for more information.



<!-- CONTACT -->
## Contact

### Team Members: 
1. Abhay Somani 
1. Jingyue Wang
1. Neil Mascarenhas - [About me?](https://about.me/neilmascarenhas)
1. Richa Choudhary
1. Viraj Patel



Project Link: [DiplomacyLab-Analysis on Tableau](https://public.tableau.com/app/profile/mascarenhasneil/viz/DiplomacyLabAnalyticsGroup5DashboardALY6070/DiplomacyLabAnalytics)


## References
<details>
  <summary>Click to expand!</summary>


1. Research Guides: UN Documentation: General Assembly: *Voting Information.* (2022). Retrieved June 7, 2021, from https://research.un.org/en/docs/ga/voting

1. Society, D. (2018, March 27). *Four questions you should ask before visualizing your data.* Retrieved June 7, 2021, from https://medium.com/the-data-experience/four-questions-you-should-ask-before-visualizing-your-data-cd20a302eb6

1. *5 Visual Best Practices.* (2021). Retrieved June 5, 2021, from https://help.tableau.com/current/blueprint/en-us/bp_visual_best_practices.htm

1. *“What is this graph telling you?”* (2021). Retrieved June 7, 2021, from https://3iap.com/key-questions-for-user-testing-data-visualizations-5vJ8JychRVGIGWq-TpFIIg/

1. *Which Chart or Graph? A guide to data visualization.* (2021). Retrieved June 7, 2021, from https://www.tableau.com/learn/whitepapers/which-chart-or-graph-is-right-for-you 



</details>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links 
https://github.com/mascarenhasneil/DiplomacyLab-Analysis
-->
[contributors-shield]: https://img.shields.io/github/contributors/mascarenhasneil/DiplomacyLab-Analysis.svg?style=flat-square
[contributors-url]: https://github.com/mascarenhasneil/DiplomacyLab-Analysis/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/mascarenhasneil/DiplomacyLab-Analysis.svg?style=flat-square
[forks-url]: https://github.com/mascarenhasneil/DiplomacyLab-Analysis/network/members
[stars-shield]: https://img.shields.io/github/stars/mascarenhasneil/DiplomacyLab-Analysis.svg?style=flat-square
[stars-url]: https://github.com/mascarenhasneil/DiplomacyLab-Analysis/stargazers
[issues-shield]: https://img.shields.io/github/issues/mascarenhasneil/DiplomacyLab-Analysis.svg?style=flat-square
[issues-url]: https://github.com/mascarenhasneil/DiplomacyLab-Analysis/issues
[license-shield]: https://img.shields.io/github/license/mascarenhasneil/DiplomacyLab-Analysis.svg?style=flat-square
[license-url]: https://github.com/mascarenhasneil/DiplomacyLab-Analysis/blob/main/LICENSE
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=flat-square&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/mascarenhasneil
