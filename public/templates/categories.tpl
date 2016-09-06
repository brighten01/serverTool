<!--Recent Cards plugin-->

<ul class="categories">

	<p>Recommended Topics</p>

</ul>



<div class="row recent-cards" itemscope itemtype="http://www.schema.org/ItemList">

	<!-- BEGIN topics -->

	<div component="categories/category" class="col-md-3 col-sm-6 col-xs-12 category-item" data-cid="{topics.category.cid}"  style="text-shadow:{recentCards.textShadow};">

		<meta itemprop="name" content="{topics.category.name}">



		<div class="category-icon">

			<div class="bg" style="opacity:{recentCards.opacity};background-color: {topics.category.bgColor};"></div>

			<a style="color: {topics.category.color};" href="{config.relative_path}/topic/{topics.slug}" itemprop="url">

				<div

						id="category-{topics.category.cid}" class="category-header category-header-image-"

						style="color: {topics.category.color};"

				>

					<!-- IF topics.category.icon -->

					<div><i class="fa {topics.category.icon} fa-4x hidden-xs"></i></div>

					<!-- ENDIF topics.category.icon -->

				</div>

			</a>



			<div class="category-box">

				<div class="category-info" style="color: {topics.category.color};">

					<a href="{config.relative_path}/topic/{topics.slug}" itemprop="url" style="color: {topics.category.color};">

						<h4><!-- IF topics.category.icon --><i class="fa {topics.category.icon} visible-xs-inline"></i> <!-- ENDIF topics.category.icon -->{topics.title}</h4>

						<div class="description" itemprop="description"><strong>{topics.category.name}</strong> </div>

					</a>

				</div>

			</div>



		</div>

	</div>

	<!-- END topics -->

</div>

<br />
<!-- IF breadcrumbs.length -->
<ol class="breadcrumb">
	<!-- BEGIN breadcrumbs -->
	<li<!-- IF @last --> component="breadcrumb/current"<!-- ENDIF @last --> itemscope="itemscope" itemtype="http://data-vocabulary.org/Breadcrumb" <!-- IF @last -->class="active"<!-- ENDIF @last -->>
		<!-- IF !@last --><a href="{breadcrumbs.url}" itemprop="url"><!-- ENDIF !@last -->
			<span itemprop="title">
				{breadcrumbs.text}
				<!-- IF @last -->
				<!-- IF !feeds:disableRSS -->
				<!-- IF rssFeedUrl --><a target="_blank" href="{rssFeedUrl}"><i class="fa fa-rss-square"></i></a><!-- ENDIF rssFeedUrl --><!-- ENDIF !feeds:disableRSS -->
				<!-- ENDIF @last -->
			</span>
		<!-- IF !@last --></a><!-- ENDIF !@last -->
	</li>
	<!-- END breadcrumbs -->
</ol>
<!-- ENDIF breadcrumbs.length -->
<div widget-area="header"></div>
<div class="row">
	<div class="col-lg-9 col-sm-12" no-widget-class="col-lg-12 col-sm-12" no-widget-target="sidebar">
		<h1 class="categories-title">[[pages:categories]]</h1>
		<ul class="categories" itemscope itemtype="http://www.schema.org/ItemList">
			<!-- BEGIN categories -->
<li component="categories/category" data-cid="{../cid}" data-numRecentReplies="1" class="row clearfix">
	<meta itemprop="name" content="{../name}">

	<div class="col-md-7 col-sm-9 col-xs-12 content">
		<div class="icon pull-left" style="{function.generateCategoryBackground}">
			<i class="fa fa-fw {../icon}"></i>
		</div>

		<h2 class="title">
<!-- IF ../link -->
<a href="{../link}" itemprop="url" target="_blank">
<!-- ELSE -->
<a href="{config.relative_path}/category/{../slug}" itemprop="url">
<!-- ENDIF ../link -->
{../name}
</a><br/>
			<!-- IF ../descriptionParsed -->
			<div class="description">
			{../descriptionParsed}
			</div>
			<!-- ENDIF ../descriptionParsed -->
			<!-- IF !config.hideSubCategories -->
			{function.generateChildrenCategories}
			<!-- ENDIF !config.hideSubCategories -->
		</h2>
		<span class="visible-xs pull-right">
			<a class="permalink" href="{../teaser.url}">
				<small class="timeago" title="{../teaser.timestampISO}"></small>
			</a>
		</span>
	</div>

	<!-- IF !../link -->
	<div class="col-md-1 hidden-sm hidden-xs stats">
		<span class="{../unread-class} human-readable-number" title="{../totalTopicCount}">{../totalTopicCount}</span><br />
		<small>[[global:topics]]</small>
	</div>
	<div class="col-md-1 hidden-sm hidden-xs stats">
		<span class="{../unread-class} human-readable-number" title="{../totalPostCount}">{../totalPostCount}</span><br />
		<small>[[global:posts]]</small>
	</div>
	<!-- IF !config.hideCategoryLastPost -->
	<div class="col-md-3 col-sm-3 teaser hidden-xs" component="topic/teaser">
<div class="card" style="border-color: {../bgColor}">
	<!-- BEGIN posts -->
	<!-- IF @first -->
	<div component="category/posts">
		<p>
			<a href="{config.relative_path}/user/{../user.userslug}">
				<!-- IF ../user.picture -->
				<img class="user-img" title="{../user.username}" alt="{../user.username}" src="{../user.picture}" title="{../user.username}"/>
				<!-- ELSE -->
				<span class="user-icon user-img" title="{../user.username}" style="background-color: {../user.icon:bgColor};">{../user.icon:text}</span>
				<!-- ENDIF ../user.picture -->
			</a>
			<a class="permalink" href="{config.relative_path}/topic/{../topic.slug}<!-- IF ../index -->/{../index}<!-- ENDIF ../index -->">
				<small class="timeago" title="{../timestampISO}"></small>
			</a>
		</p>
		<div class="post-content">
			{../content}
		</div>
	</div>
	<!-- ENDIF @first -->
	<!-- END posts -->

	<!-- IF !../posts.length -->
	<div component="category/posts">
		<div class="post-content">
			[[category:no_new_posts]]
		</div>
	</div>
	<!-- ENDIF !../posts.length -->
</div>
	</div>
	<!-- ENDIF !config.hideCategoryLastPost -->
	<!-- ENDIF !../link -->
</li>
			<!-- END categories -->
		</ul>
	</div>
	<div widget-area="sidebar" class="col-lg-3 col-sm-12"></div>
</div>
<div widget-area="footer"></div>
