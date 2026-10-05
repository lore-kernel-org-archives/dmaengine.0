Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF201391E6D
	for <dmaengine@vger.kernel.org>; Mon,  5 Oct 2026 22:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791239222; cv=none; b=SvNOsHzsL9g5YTihFndeMLPyl6mJ+B9qSZaE14G6LlAvMbhX3ZuvnjaxDAIMAZkL8la3v7csMJp9PAH5nRNpKEyK3+LNTYPhsQiEmZw2ze855/AqYg/nRfIO2EOZV8TklDjOyRbYZ03zWN7l/PiL+AmsR7ToF2rI/cAJ6Dshqj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791239222; c=relaxed/simple;
	bh=qhytkzECjpt5g2H6bHVUDNrG4TCrLNT1uj20IZf81Kc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SQrmz+PIqsG5QQ/7E4u0asWqWsHXE45NH8gsnMZZKeapqOUAKIiHHR9UVBXGOg8qOClHRYyvXZA3XhrAfbVr5PjIxpfXaWHZkKAfdp3mA1+u2oNosmZLeBFwPXwe6AP/It/2VoWBkJROzXGyxBuqafFOjf/DTB12dsN7RzSlwX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jg1VcPPb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jg1VcPPb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E2001F0089A
	for <dmaengine@vger.kernel.org>; Mon,  5 Oct 2026 22:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791239221;
	bh=qhytkzECjpt5g2H6bHVUDNrG4TCrLNT1uj20IZf81Kc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Jg1VcPPbQWpmVbKKwGIm34GkqK7plcQWV1ZOlvVvyVg1Su7yMQCahRrRmdwZamdfG
	 hInc+FVIaYsmOXfGyKQZgs4bYb2Jc6uwi5M6lJZKK/T7XKbg5NghA153QfmVsouDIb
	 qtCQ99lheWj/g/MxtHy4FHuqcbb0BVZp6sFD43bW81o6/OopRokMTfZt0+FivB2I3S
	 Tns11uhcTPm0yVq1E7HU3NFezPNuwtvU4G1ZmAwPglazl7H89eXiyNKsObHqhZzz0e
	 TJFSXhLVJATqh4ercNACpG5nHfO359N8u6IeXE5GNEqb3Zg3Y5m1SxZ9gzh5z+azRJ
	 C/62CeEuRVhiw==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5bcc3b412cfso958403e87.2
        for <dmaengine@vger.kernel.org>; Mon, 05 Oct 2026 15:27:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy25FKEwLyl7jB3/x3fcQ9Xd3G8jw2c21NCH4QHPvyjePxGmJa/estBmErFtO4uAC2WzhjQU7n6sHs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRugO7gOLcpG78s6rdpVQVO3hlsAO8v5g28fnrVUL3His9STih
	riR66gvxMNjptzxvzfx02gbXI4BSMqjP1J5F/Hnng+YFZGSmsgKX8e1JicMseeQF6Pjj6tGrqoo
	kv9hEkSV70drPVP8UYRNRnXcD0MUfevY=
X-Received: by 2002:a05:6512:3b8a:b0:5b7:a987:d03d with SMTP id
 2adb3069b0e04-5bb9bb17536mr4098119e87.21.1791239220085; Mon, 05 Oct 2026
 15:27:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927-dma40-fixes-v7-0-89f595e8851d@kernel.org>
 <20260927-dma40-fixes-v7-22-89f595e8851d@kernel.org> <asPEvh3O1ysaeeGs@parshuram>
In-Reply-To: <asPEvh3O1ysaeeGs@parshuram>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 6 Oct 2026 00:26:47 +0200
X-Gmail-Original-Message-ID: <CAD++jL=c5PoFM9cDsAu+cbmauOD6QrpYuwo90QHKBbvpjoQcVw@mail.gmail.com>
X-Gm-Features: AclHuK_RofFOjivNVgQU3t71YIooA4RWGvhqXQ6_bQ0T5JHwvUzdPKecH_PlZBU
Message-ID: <CAD++jL=c5PoFM9cDsAu+cbmauOD6QrpYuwo90QHKBbvpjoQcVw@mail.gmail.com>
Subject: Re: [PATCH v7 22/24] dmaengine: ste_dma40: Search all blocks for
 fixed logical channels
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
	phone-devel@vger.kernel.org, sashiko-bot@kernel.org, 
	Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vinod,

On Mon, Oct 5, 2026 at 5:39=E2=80=AFPM Vinod Koul <vkoul@kernel.org> wrote:
> On 27-09-26, 11:03, Linus Walleij wrote:
> > Fixed logical channel allocation scans physical channels in blocks of
> > eight. When the requested physical channel does not belong to the first
> > block, d40_allocate_channel() returns -EINVAL instead of checking later
> > blocks.
> >
> > Skip nonmatching blocks so controllers with more than eight physical
> > channels can allocate fixed logical channels from the later blocks.
>
> This failed to apply for me, I have skipped and applied the rest

Thanks Vinod, I'll rebase it on your tree and send it separately.

Yours,
Linus Walleij
