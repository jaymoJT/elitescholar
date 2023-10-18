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

 <div id="main-site" class="page_index_site">

 <div class="jumbotron">
 <h1>Hello, world!</h1>
 <p>This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.</p>
 <p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a></p>
</div>
	 

{if !count($journals)}
	<div class="no_journals">
		{translate key="site.noJournals"}
	</div>

{else}
	<div class="slider-container">
		<div class="slider">
			{foreach from=$journals item=journal}
				{capture assign="url"}{url journal=$journal->getPath()}{/capture}
				{assign var="thumb" value=$journal->getLocalizedData('journalThumbnail')}
				{assign var="description" value=$journal->getLocalizedDescription()}
	            <a href="{$url|escape}">
					<img class="media-object journal-slide-image" src="{$journalFilesPath}{$journal->getId()}/{$thumb.uploadName|escape:"url"}"{if $thumb.altText} alt="{$thumb.altText|escape}"{/if}>
						
				</a>
			{/foreach}
		</div>
		<div class="slider-control prev" onclick="moveSlider(-1)">&#9665;</div>
        <div class="slider-control next" onclick="moveSlider(1)">&#9655;</div>
    </div>
	
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