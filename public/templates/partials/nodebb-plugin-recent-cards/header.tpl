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
