As of August 28, 2020, the COVID-19 pandemic has resulted in more than 24 million cases, with more than 0.8 million deaths worldwide (Johns Hopkins University 2020). Among all countries, the United States of America has the highest number of infections (more than 5.9 million cases) and fatalities (over 0.18 million deaths). The situation has drastically changed and disrupted people’s daily lives, with millions of jobs lost. Since the start of the outbreak, we have seen hundreds and thousands of businesses temporarily shut down, schools temporarily closed, travel plans canceled, and entertainment put on hold. Still, many employees work from home, and students take courses online. Every person and organization is anxious to know when the situation will end, or, at least, what the near future will be like.

To answer these questions, having a reliable prediction tool to forecast future cases and deaths of COVID-19 is of foremost importance. Motivated by this, our paper titled 
[“A Geotemporal Clustering Model for COVID-19 Projection”](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3686506)
proposes a clustering based algorithm to predict the state-level COVID-19 cases in the United States, using the state-level population and historical COVID-19 case data as input. Our algorithm has two novel features. First, we treat a (state, date) pair as one observation in the COVID-19 case data, summarize features from the data, and classify similar observations using k-means clustering. Second, we use the similarity between the observations in the same cluster to capture the similarity of future trajectory of cases. Thus, when predicting the number of cases in a state in the future, we first map the pair of this state and the current date to a corresponding cluster, then take the observable future of older observations in this cluster as potential samples. Using mean absolute percentage error (MAPE) as the performance metric, we demonstrate that our algorithm provides reliable results for prediction periods ranging from 1 to 20 days. Our algorithm achieves the highest 7-day prediction accuracy both at the state and the national levels compared to three existing models and one intuitive baseline model. Our results indicate that in the next 20 days, states may be in starkly different situations if there are no interventions. While some states are getting better, the cases in others are still trending upward.

Below are prediction results in state-level updated on November 6, 2020.
The solid blue line is historical daily cases.
The dash blue line is daily cases predictions. The daily cases are smoothed as 7-day average. 
The solid red line is historical cumulative cases. The dash red line is cumulative cases predictions.


![Alabama](https://user-images.githubusercontent.com/67207788/98436869-c797a500-20ac-11eb-8cda-e2b4caf05e83.png)
![Alaska](https://user-images.githubusercontent.com/67207788/98436871-cb2b2c00-20ac-11eb-9925-18627458be25.png)
![Arizona](https://user-images.githubusercontent.com/67207788/98436873-ccf4ef80-20ac-11eb-8bd0-f794e65e97b1.png)
![Arkansas](https://user-images.githubusercontent.com/67207788/98436875-cebeb300-20ac-11eb-9616-505376ce19b7.png)
![California](https://user-images.githubusercontent.com/67207788/98436877-d0887680-20ac-11eb-8173-d1b90848c378.png)
![Colorado](https://user-images.githubusercontent.com/67207788/98436880-d41bfd80-20ac-11eb-96a4-bf71a42ab4b7.png)
![Connecticut](https://user-images.githubusercontent.com/67207788/98436882-d5e5c100-20ac-11eb-9877-923774e6023b.png)
![Delaware](https://user-images.githubusercontent.com/67207788/98436883-d67e5780-20ac-11eb-8387-f794958099fd.png)
![District of Columbia](https://user-images.githubusercontent.com/67207788/98436884-d7af8480-20ac-11eb-9587-0624b0b90946.png)
![Florida](https://user-images.githubusercontent.com/67207788/98436887-d8e0b180-20ac-11eb-82ca-483e381a994f.png)
![Georgia](https://user-images.githubusercontent.com/67207788/98436890-db430b80-20ac-11eb-9982-09136d92f562.png)
![Hawaii](https://user-images.githubusercontent.com/67207788/98436891-dc743880-20ac-11eb-9431-92ffcdceb7e7.png)
![Idaho](https://user-images.githubusercontent.com/67207788/98436892-dda56580-20ac-11eb-82c3-7e0c4335820c.png)
![Illinois](https://user-images.githubusercontent.com/67207788/98436894-df6f2900-20ac-11eb-8f9d-9f13003dfd00.png)
![Indiana](https://user-images.githubusercontent.com/67207788/98436896-e0a05600-20ac-11eb-8818-9a5f6fd778da.png)
![Iowa](https://user-images.githubusercontent.com/67207788/98436899-e1d18300-20ac-11eb-871e-fe3b7deabcf7.png)
![Kansas](https://user-images.githubusercontent.com/67207788/98436903-e302b000-20ac-11eb-8eeb-ba04eeb0d490.png)
![Kentucky](https://user-images.githubusercontent.com/67207788/98436906-e433dd00-20ac-11eb-893b-695fd8032d94.png)
![Louisiana](https://user-images.githubusercontent.com/67207788/98436912-e5fda080-20ac-11eb-9f83-98baff5e6640.png)
![Maine](https://user-images.githubusercontent.com/67207788/98436915-e85ffa80-20ac-11eb-974e-d9df24b4d271.png)
![Maryland](https://user-images.githubusercontent.com/67207788/98436918-ea29be00-20ac-11eb-831a-61180f0901f6.png)
![Massachusetts](https://user-images.githubusercontent.com/67207788/98436919-eb5aeb00-20ac-11eb-947b-5bf918bcd0aa.png)
![Michigan](https://user-images.githubusercontent.com/67207788/98436921-ed24ae80-20ac-11eb-8a0f-1938aca9d440.png)
![Minnesota](https://user-images.githubusercontent.com/67207788/98436923-ee55db80-20ac-11eb-977a-8811ffff4565.png)
![Mississippi](https://user-images.githubusercontent.com/67207788/98436927-f01f9f00-20ac-11eb-8923-81af910e7dd8.png)
![Missouri](https://user-images.githubusercontent.com/67207788/98436931-f150cc00-20ac-11eb-8086-e938413ac1a0.png)
![Montana](https://user-images.githubusercontent.com/67207788/98436935-f281f900-20ac-11eb-9a44-4ab23bf1faf9.png)
![Nebraska](https://user-images.githubusercontent.com/67207788/98436941-f3b32600-20ac-11eb-83a2-d46f93a29dbb.png)
![Nevada](https://user-images.githubusercontent.com/67207788/98436947-f57ce980-20ac-11eb-9454-2044868b72c4.png)
![New Hampshire](https://user-images.githubusercontent.com/67207788/98436953-f6158000-20ac-11eb-8566-45977f793b85.png)
![New Jersey](https://user-images.githubusercontent.com/67207788/98436961-f877da00-20ac-11eb-9d08-ae7d54c6d38a.png)
![New Mexico](https://user-images.githubusercontent.com/67207788/98436969-fada3400-20ac-11eb-8cae-12e25f818d68.png)
![New York](https://user-images.githubusercontent.com/67207788/98436970-fca3f780-20ac-11eb-856c-007831fa6396.png)
![North Carolina](https://user-images.githubusercontent.com/67207788/98436971-fdd52480-20ac-11eb-8307-6653d4d007e1.png)
![North Dakota](https://user-images.githubusercontent.com/67207788/98436973-ff065180-20ac-11eb-9e80-196f00989405.png)
![Ohio](https://user-images.githubusercontent.com/67207788/98436975-00d01500-20ad-11eb-8227-fe8cd69eaab6.png)
![Oklahoma](https://user-images.githubusercontent.com/67207788/98436978-0299d880-20ad-11eb-8ec4-d397ff35f05a.png)
![Oregon](https://user-images.githubusercontent.com/67207788/98436980-03cb0580-20ad-11eb-8213-8ce48ae9072a.png)
![Pennsylvania](https://user-images.githubusercontent.com/67207788/98436981-0594c900-20ad-11eb-8e5d-e816b678e490.png)
![Rhode Island](https://user-images.githubusercontent.com/67207788/98436982-06c5f600-20ad-11eb-971a-0c17efcf014b.png)
![South Carolina](https://user-images.githubusercontent.com/67207788/98436984-07f72300-20ad-11eb-8483-9b7dda9d4509.png)
![South Dakota](https://user-images.githubusercontent.com/67207788/98436985-09285000-20ad-11eb-861c-1fd413fcc1f3.png)
![Tennessee](https://user-images.githubusercontent.com/67207788/98436986-0a597d00-20ad-11eb-96fc-dae9f8a9de4b.png)
![Texas](https://user-images.githubusercontent.com/67207788/98436987-0b8aaa00-20ad-11eb-899a-fc4b5e12566f.png)
![Utah](https://user-images.githubusercontent.com/67207788/98436990-0f1e3100-20ad-11eb-8151-55bddcd96415.png)
![Vermont](https://user-images.githubusercontent.com/67207788/98436993-104f5e00-20ad-11eb-9c17-10a6ae4928c8.png)
![Virginia](https://user-images.githubusercontent.com/67207788/98436995-12192180-20ad-11eb-9412-82318f2ddae3.png)
![Washington](https://user-images.githubusercontent.com/67207788/98436998-134a4e80-20ad-11eb-964a-24247d1efb39.png)
![West Virginia](https://user-images.githubusercontent.com/67207788/98437001-15141200-20ad-11eb-843f-d3dd967a5dd4.png)
![Wisconsin](https://user-images.githubusercontent.com/67207788/98437002-16ddd580-20ad-11eb-9600-b975d6b1b9d8.png)
![Wyoming](https://user-images.githubusercontent.com/67207788/98437004-19402f80-20ad-11eb-9c4f-3d0d1b3b3612.png)


