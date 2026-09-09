Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85693D5221
	for <dmaengine@vger.kernel.org>; Wed,  9 Sep 2026 23:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788996883; cv=none; b=iE5KhEDTFF7SoLlWmmXQqEpBjBYZFXeb0cCwr1pnaDr7+rcuESlh8cmrjLfJ23TEZO8gaJOeXObuFprWDQ9YWrWTUFvzAhypqiDxyb8t6Dz7E2rpdNqM8yT4Txgc50dA2SNdTMHzXuDqja5fZMRWMRwFr1mfpriFsOlzSddNwp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788996883; c=relaxed/simple;
	bh=Y9Wifv9iKCgz4UIU+qosssMHt5oQdpfXn2yMrfOx/Kk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SAULSggOlbz670dliicJy+gKtIidSIgNkldkRvsRA+IHe+J9ePLwMp/CYmKYNgSrgTpl+XVsQPZ7IhKbJiRd+WWhftBh8BfUxUdsNFR674vh/E84ykdtyy3/7u3YbRRHNRxuZNvpcFwXAqWm+YwaSf0xL+4RF/WEoxyRd2ivkZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JQY4p2Yj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JQY4p2Yj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B440A1F000FF;
	Wed,  9 Sep 2026 23:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788996882;
	bh=aontXj9MMcEuYDk6jkZSJxGOcnHhDAOXNs1XExhJWWQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JQY4p2YjWl6qurXhXQNAY++9rwBTDQbP2qKR2x7WDYisY87IccfhHjKn/FZoEAhcs
	 qrbo26xOQ+aP4IfwKfiOsF5388BTV7IPQ+Ak4Oj1vR0puwh6GzD50OaWRKxaGwIEkK
	 +wEAiJP8WWHOPHCij4IQhx9E4szb6zT1kPmMUMKbyISEW5avGKI4H5NXK5r7Wm9B9Z
	 1ZVz8oEe5jvVtrwJjqqdrG/8VPW+4f3n8VZLjscshfQ8nj97VccBKKfq72BwskyJpO
	 YGckB1Q5Qoq3OSnbh3mIJTAzLTOVOrQPKSArL5g/8+/JhRJ24cSqrRKWcVZ1ODZ2P+
	 1jVaGjUtXw5cQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: bestcomm: use
 devm_platform_get_and_ioremap_resource() to simplify code
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260909232623.89321-1-rosenp@gmail.com>
References: <20260909232623.89321-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 23:34:41 +0000
Message-Id: <20260909233441.B440A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Dangling Pointer / Use-After-Free in error path
--

commit fa3bb7a565a9593e1a87078d2bf750faaf572e6d
Author: Rosen Penev <rosenp@gmail.com>

dmaengine: bestcomm: use devm_platform_get_and_ioremap_resource() to simpli=
fy code

Replace the open-coded resource lookup, request_mem_region, ioremap and
the manual iounmap/release_mem_region cleanup in probe/remove with the
managed devm_platform_get_and_ioremap_resource() helper. This removes the
now-unused error-unmap/release paths and simplifies probing.

> diff --git a/drivers/dma/bestcomm/bestcomm.c b/drivers/dma/bestcomm/bestc=
omm.c
> index 432b43520ddc9..44ff4a42376b1 100644
> --- a/drivers/dma/bestcomm/bestcomm.c
> +++ b/drivers/dma/bestcomm/bestcomm.c

[ ... ]

> @@ -439,10 +422,6 @@ static int mpc52xx_bcom_probe(struct platform_device=
 *op)
>  	return 0;
> =20
>  	/* Error path */
> -error_unmap:
> -	iounmap(bcom_eng->regs);
> -error_release:
> -	release_mem_region(res_bcom.start, sizeof(struct mpc52xx_sdma));
>  error_sramclean:
>  	kfree(bcom_eng);

[Severity: High]
This isn't a bug introduced by this patch, but does this error path leave
a dangling pointer?

When mpc52xx_bcom_probe() fails after allocating memory for the globally
visible bcom_eng pointer, it frees the memory but doesn't reset bcom_eng
to NULL.

If probe fails (e.g., during bcom_engine_init()), the global bcom_eng=20
will point to freed memory. If dependent drivers load later and call=20
functions like bcom_task_alloc(), wouldn't they dereference this dangling
pointer?

>  	bcom_sram_cleanup();
>  error_ofput:
>  	of_node_put(op->dev.of_node);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909232623.8932=
1-1-rosenp@gmail.com?part=3D1
