
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

<div class="row">
	<div class="col-md-4">
		<div class="chat-search hidden-xs">
			<input class="form-control" type="text" component="chat/search" placeholder="[[users:enter_username]]" />
		</div>
		<ul component="chat/search/list" class="chat-search-list">
			
		</ul>
		<ul component="chat/recent" class="chats-list" data-nextstart="{nextStart}">
			<!-- BEGIN rooms -->
<li component="chat/recent/room" data-roomid="{rooms.roomId}" class="<!-- IF rooms.unread -->unread<!-- ENDIF rooms.unread -->">
	<i class="fa fa-times pull-right leave" component="chat/leave"></i>
	<!-- IF rooms.lastUser.uid -->
	<div data-username="{rooms.lastUser.username}" data-uid="{rooms.lastUser.uid}">
		<!-- IF rooms.lastUser.picture -->
		<img class="user-img" src="{rooms.lastUser.picture}">
		<!-- ELSE -->
		<div class="user-icon user-img" style="background-color: {rooms.lastUser.icon:bgColor};">{rooms.lastUser.icon:text}</div>
		<!-- ENDIF rooms.lastUser.picture -->
		<i component="user/status" title="[[global:{rooms.lastUser.status}]]" class="fa fa-circle status {rooms.lastUser.status}"></i>
		<span class="username">{rooms.usernames}</span>
	</div>
	<!-- ELSE -->
	[[modules:chat.no-users-in-room]]
	<!-- ENDIF rooms.lastUser.uid -->

	<span class="teaser-content">{rooms.teaser.content}</span>
	<span class="teaser-timestamp timeago pull-right" title="{rooms.teaser.timestampISO}"></span>
</li>
			<!-- END rooms -->
		</ul>
	</div>

	<div class="col-md-8 hidden-sm hidden-xs">
		<!-- IF roomId -->
		<div component="chat/messages" class="expanded-chat" data-roomid="{roomId}">

			<button type="button" class="close" data-action="pop-out"><span aria-hidden="true"><i class="fa fa-compress"></i></span><span class="sr-only">[[modules:chat.pop-out]]</span></button>

			<!-- IF showUserInput -->
			<div class="users-tag-container">
				<input class="users-tag-input" type="text" class="form-control" placeholder="[[modules:chat.add-users-to-room]]" tabindex="4"/>
			</div>
			<!-- ENDIF showUserInput -->

			<input class="form-control" component="chat/room/name" value="{roomName}" <!-- IF !isOwner -->disabled<!-- ENDIF !isOwner -->/>

			<span class="since-bar"><a href="#" class="selected" data-since="recent">[[recent:title]]</a> &bull; <a href="#" data-since="week">[[modules:chat.seven_days]]</a> &bull; <a href="#" data-since="month">[[modules:chat.thirty_days]]</a> &bull; <a href="#" data-since="threemonths">[[modules:chat.three_months]]</a></span>
			<ul class="chat-content">
<!-- BEGIN messages -->
				<li component="chat/message" class="chat-message clear" data-mid="{messages.messageId}" data-uid="{messages.fromuid}" data-self="{messages.self}" data-break="{messages.newSet}">
					<div class="message-header">
						<a href="{config.relative_path}/user/{messages.fromUser.userslug}">
							<!-- IF messages.fromUser.picture -->
							<img class="chat-user-image not-responsive" src="{messages.fromUser.picture}">
							<!-- ELSE -->
							<div class="user-icon chat-user-image" style="background-color: {messages.fromUser.icon:bgColor};">{messages.fromUser.icon:text}</div>
							<!-- ENDIF messages.fromUser.picture -->
						</a>
						<strong><span class="chat-user">{messages.fromUser.username}</span></strong>
						<span class="chat-timestamp timeago" title="{messages.timestampISO}"></span>
					</div>
					<div component="chat/message/body" class="message-body">
						<!-- IF messages.edited -->
						<small class="text-muted pull-right" title="[[global:edited]] {messages.editedISO}"><i class="fa fa-edit"></i></span></small>
						<!-- ENDIF messages.edited -->
						<!-- IF messages.self -->
						<div class="pull-right btn-group controls">
							<button class="btn btn-xs btn-link" data-action="edit"><i class="fa fa-pencil"></i></button>
							<button class="btn btn-xs btn-link" data-action="delete"><i class="fa fa-times"></i></button>
						</div>
						<!-- ENDIF messages.self -->
						{messages.content}
					</div>
				</li>
<!-- END messages -->
			</ul>
			<div class="input-group">
				<textarea component="chat/input" placeholder="[[modules:chat.placeholder]]" class="form-control chat-input mousetrap" rows="1"></textarea>
				<span class="input-group-btn">
					<button class="btn btn-primary" type="button" data-action="send">[[modules:chat.send]]</button>
				</span>
			</div>
		</div>
		<!-- ELSE -->
		<div class="alert alert-info">
			[[modules:chat.no-messages]]
		</div>
		<!-- ENDIF roomId -->
	</div>
</div>
