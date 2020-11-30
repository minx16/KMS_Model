As of August 28, 2020, the COVID-19 pandemic has resulted in more than 24 million cases, with more than 0.8 million deaths worldwide (Johns Hopkins University 2020). Among all countries, the United States of America has the highest number of infections (more than 5.9 million cases) and fatalities (over 0.18 million deaths). The situation has drastically changed and disrupted people’s daily lives, with millions of jobs lost. Since the start of the outbreak, we have seen hundreds and thousands of businesses temporarily shut down, schools temporarily closed, travel plans canceled, and entertainment put on hold. Still, many employees work from home, and students take courses online. Every person and organization is anxious to know when the situation will end, or, at least, what the near future will be like.

To answer these questions, having a reliable prediction tool to forecast future cases and deaths of COVID-19 is of foremost importance. Motivated by this, our paper titled 
[“A Geotemporal Clustering Model for COVID-19 Projection”](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3686506)
proposes a clustering based algorithm to predict the state-level COVID-19 cases in the United States, using the state-level population and historical COVID-19 case data as input. Our algorithm has two novel features. First, we treat a (state, date) pair as one observation in the COVID-19 case data, summarize features from the data, and classify similar observations using k-means clustering. Second, we use the similarity between the observations in the same cluster to capture the similarity of future trajectory of cases. Thus, when predicting the number of cases in a state in the future, we first map the pair of this state and the current date to a corresponding cluster, then take the observable future of older observations in this cluster as potential samples. Using mean absolute percentage error (MAPE) as the performance metric, we demonstrate that our algorithm provides reliable results for prediction periods ranging from 1 to 20 days. Our algorithm achieves the highest 7-day prediction accuracy both at the state and the national levels compared to three existing models and one intuitive baseline model. Our results indicate that in the next 20 days, states may be in starkly different situations if there are no interventions. While some states are getting better, the cases in others are still trending upward.

Below are prediction results in state-level updated on November 29, 2020.
The solid blue line is historical daily cases.
The dash blue line is daily cases predictions. The daily cases are smoothed as 7-day average. 
The solid red line is historical cumulative cases. The dash red line is cumulative cases predictions.



![Alabama](https://user-images.githubusercontent.com/67207788/100576679-a17cb380-32ac-11eb-9138-4f90ede2cde5.png)
![Alaska](https://user-images.githubusercontent.com/67207788/100576685-a6d9fe00-32ac-11eb-967b-e64f61d91708.png)
![Arizona](https://user-images.githubusercontent.com/67207788/100576692-aa6d8500-32ac-11eb-9ad3-3e071d151a6d.png)
![Arkansas](https://user-images.githubusercontent.com/67207788/100576697-accfdf00-32ac-11eb-8349-fd1036458e37.png)
![California](https://user-images.githubusercontent.com/67207788/100576703-ae99a280-32ac-11eb-8d66-f7223468ba9e.png)
![Colorado](https://user-images.githubusercontent.com/67207788/100576706-b0636600-32ac-11eb-8dd9-4e0f65e1eec2.png)
![Connecticut](https://user-images.githubusercontent.com/67207788/100576709-b22d2980-32ac-11eb-8a70-72620ed38c88.png)
![Delaware](https://user-images.githubusercontent.com/67207788/100576713-b48f8380-32ac-11eb-8a24-80682f44b7a2.png)
![District of Columbia](https://user-images.githubusercontent.com/67207788/100576717-b5281a00-32ac-11eb-827f-4acb9887f37f.png)
![Florida](https://user-images.githubusercontent.com/67207788/100576719-b6594700-32ac-11eb-9313-f8bf57f9d28b.png)
![Georgia](https://user-images.githubusercontent.com/67207788/100576723-b8230a80-32ac-11eb-80c0-de1b64b73d9b.png)
![Hawaii](https://user-images.githubusercontent.com/67207788/100576726-b9543780-32ac-11eb-8abe-1f2b855718b0.png)
![Idaho](https://user-images.githubusercontent.com/67207788/100576730-b9ecce00-32ac-11eb-8343-1705eee2b30c.png)
![Illinois](https://user-images.githubusercontent.com/67207788/100576734-bb1dfb00-32ac-11eb-9c65-8d70a82e0b1b.png)
![Indiana](https://user-images.githubusercontent.com/67207788/100576739-bd805500-32ac-11eb-8999-ec5ecf3169b6.png)
![Iowa](https://user-images.githubusercontent.com/67207788/100576741-beb18200-32ac-11eb-82ac-8b88184570d0.png)
![Kansas](https://user-images.githubusercontent.com/67207788/100576747-c113dc00-32ac-11eb-93b9-a31f42d78b9d.png)
![Kentucky](https://user-images.githubusercontent.com/67207788/100576748-c2450900-32ac-11eb-9751-2b662c76340d.png)
![Louisiana](https://user-images.githubusercontent.com/67207788/100576750-c40ecc80-32ac-11eb-85bc-77187b4d4dd6.png)
![Maine](https://user-images.githubusercontent.com/67207788/100576754-c5d89000-32ac-11eb-9f36-eabd206dc022.png)
![Maryland](https://user-images.githubusercontent.com/67207788/100576759-c7a25380-32ac-11eb-9e0e-d5aa98a3e9ad.png)
![Massachusetts](https://user-images.githubusercontent.com/67207788/100576765-cb35da80-32ac-11eb-9d6d-1c8bbcc39288.png)
![Michigan](https://user-images.githubusercontent.com/67207788/100576770-cc670780-32ac-11eb-8fe2-993f3b82888c.png)
![Minnesota](https://user-images.githubusercontent.com/67207788/100576771-ccff9e00-32ac-11eb-8117-896008f36114.png)
![Mississippi](https://user-images.githubusercontent.com/67207788/100576774-ce30cb00-32ac-11eb-9b35-202ae8c452ee.png)
![Missouri](https://user-images.githubusercontent.com/67207788/100576775-cf61f800-32ac-11eb-8851-cea6124df634.png)
![Montana](https://user-images.githubusercontent.com/67207788/100576779-d0932500-32ac-11eb-842b-bdcb8007df85.png)
![Nebraska](https://user-images.githubusercontent.com/67207788/100576784-d1c45200-32ac-11eb-9a7f-cfa411fed5ae.png)
![Nevada](https://user-images.githubusercontent.com/67207788/100576788-d38e1580-32ac-11eb-84e3-3b5a2f3bdf03.png)
![New Hampshire](https://user-images.githubusercontent.com/67207788/100576797-d557d900-32ac-11eb-8c30-f2df290f83e0.png)
![New Jersey](https://user-images.githubusercontent.com/67207788/100576801-d5f06f80-32ac-11eb-8bcb-dd72e87994cd.png)
![New Mexico](https://user-images.githubusercontent.com/67207788/100576806-d7219c80-32ac-11eb-999c-45a403b0833c.png)
![New York](https://user-images.githubusercontent.com/67207788/100576807-d852c980-32ac-11eb-9d43-cde80efb0c2f.png)
![North Carolina](https://user-images.githubusercontent.com/67207788/100576808-d983f680-32ac-11eb-83f4-7f079271c705.png)
![North Dakota](https://user-images.githubusercontent.com/67207788/100576813-db4dba00-32ac-11eb-92a8-7090026e9ec0.png)
![Ohio](https://user-images.githubusercontent.com/67207788/100576819-ddb01400-32ac-11eb-81e4-978e56d81f04.png)
![Oklahoma](https://user-images.githubusercontent.com/67207788/100576822-e0ab0480-32ac-11eb-860f-ccc4e093c53e.png)
![Oregon](https://user-images.githubusercontent.com/67207788/100576826-e1dc3180-32ac-11eb-8340-549cc77dc097.png)
![Pennsylvania](https://user-images.githubusercontent.com/67207788/100576828-e30d5e80-32ac-11eb-9393-1d5e18a5a127.png)
![Rhode Island](https://user-images.githubusercontent.com/67207788/100576834-e7397c00-32ac-11eb-8a7e-87b84604ec25.png)
![South Carolina](https://user-images.githubusercontent.com/67207788/100576839-e9033f80-32ac-11eb-873a-b63c7dfd8ddb.png)
![South Dakota](https://user-images.githubusercontent.com/67207788/100576841-eacd0300-32ac-11eb-8c22-1dc93bda5954.png)
![Tennessee](https://user-images.githubusercontent.com/67207788/100576847-edc7f380-32ac-11eb-9465-48eae1a948a0.png)
![Texas](https://user-images.githubusercontent.com/67207788/100576849-eef92080-32ac-11eb-8b8d-316145ec58d7.png)
![Utah](https://user-images.githubusercontent.com/67207788/100576853-f02a4d80-32ac-11eb-9784-6cf1a1e24779.png)
![Vermont](https://user-images.githubusercontent.com/67207788/100576856-f0c2e400-32ac-11eb-965a-3cbbd8bb59ac.png)
![Virginia](https://user-images.githubusercontent.com/67207788/100576858-f1f41100-32ac-11eb-8d18-b654a2a6e9bf.png)
![Washington](https://user-images.githubusercontent.com/67207788/100576865-f4566b00-32ac-11eb-822f-8d4d677105f5.png)
![West Virginia](https://user-images.githubusercontent.com/67207788/100576867-f6202e80-32ac-11eb-88fa-f6ab70210d15.png)
![Wisconsin](https://user-images.githubusercontent.com/67207788/100576875-f7e9f200-32ac-11eb-9884-31734598e5af.png)
![Wyoming](https://user-images.githubusercontent.com/67207788/100576882-f91b1f00-32ac-11eb-95eb-f58e945d0c1a.png)



