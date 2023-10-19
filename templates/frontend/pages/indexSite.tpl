{**
 * templates/frontend/pages/indexSite.tpl
 *
 * Copyright (c) 2014-2023 Simon Fraser University
 * Copyright (c) 2003-2023 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * Site index.
 *
 *}
 {include file="frontend/components/header.tpl"}

 <div id="main-site" class="page_index_site" >

 <div class="jumbotron homepage-banner" style="border-radius:8px !important;">
	{if $about}
		<div class="about_site">
			{$about}
		</div>
		
	{/if}
 
    <p><a class="btn btn-primary btn-lg" href="{$loginUrl}" role="button">Learn more</a></p>
</div>
	 


{if !count($journals)}
	<div class="no_journals">
		{translate key="site.noJournals"}
	</div>

{else}
	<div class="title-section">
	    <h5>Published Journals</h5> <hr>
	</div>
	<ul class="media-list">
		{foreach from=$journals item=journal}
			{capture assign="url"}{url journal=$journal->getPath()}{/capture}
			{assign var="thumb" value=$journal->getLocalizedData('journalThumbnail')}
			{assign var="description" value=$journal->getLocalizedDescription()}

			<div class="panel panel-default">
			    <div class="panel-heading">
				    <a href="{$url|escape}" rel="bookmark" class="journal-title">
						{$journal->getLocalizedName()}
					</a>
				</div>
			    <div class="panel-body">
					<li class="media">
						{if $thumb}
							<div class="media-left">
								<a href="{$url|escape}">
									<img class="media-object" src="{$journalFilesPath}{$journal->getId()}/{$thumb.uploadName|escape:"url"}"{if $thumb.altText} alt="{$thumb.altText|escape}"{/if}>
								</a>
							</div>
						{/if}

						<div class="media-body">
							<h3 class="media-heading">
								
							</h3>
							{if $description}
								<div class="description">
									{$description|nl2br}
								</div>
							{/if}
							<ul class="nav nav-pills">
								<li class="view">
									<a href="{$url|escape}">
										{translate key="site.journalView"}
									</a>
								</li>
								<li class="current">
									<a href="{url|escape journal=$journal->getPath() page="issue" op="current"}">
										{translate key="site.journalCurrent"}
									</a>
								</li>
							</ul>
						</div>
					</li>
				</div>
			</div>
			
		{/foreach}
	</ul>
{/if}







	 
	 


	 

	 



	 

	 

 
	 {if $about}
		 <div class="about_site">
			 {$about|nl2br}
		 </div>
	 {/if}
 
	 <div class="journals">
		 <div class="page-header">
			 <h2>
				 {translate key="context.contexts"}
			 </h2>
		 </div>
 
		 
	 </div>
 
 </div><!-- .page -->
 
 <script>


 var currentIndex = 0;

 function moveSlider(direction) {
	 currentIndex += direction;
	 var slider = document.querySelector(".slider");
	 var images = slider.querySelectorAll("img");
	 if (currentIndex < 0) {
		 currentIndex = images.length - 1;
	 } else if (currentIndex >= images.length) {
		 currentIndex = 0;
	 }
	 var offset = -currentIndex * (100 / images.length);
	 slider.style.transform = "translateX(" + offset + "%)";
 }
   
</script>
 {include file="frontend/components/footer.tpl"}