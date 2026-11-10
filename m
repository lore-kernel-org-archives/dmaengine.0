Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=204.191.154.188
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794343981;
	b=DZLQtspZdsF3CghfWPGmdI8U/kVi6WT0SQ7Rq+ep3V9CdRo4YhOGRkCHbs5xJvVjr/X5
	 3pUdiCldg/myP81uw43/WWKVJ2oUo3EJUEkrRYKAHO/jL0n29ZQyZ10cYE0N31uowhr9D
	 e8TT4rtk3O488vgcbmVhfOAgB07Glw306XvBoSleshR74ZvfmOAVOq4hg4uevY1naMk8R
	 CkZPAjop3/Skmu+XnNDFPbHrypJnbf5JLDc68AwBZsSegVg6hhIKCAV9gDnHB1jJNjGkv
	 nn9+gpgsspmfECTV9FW17U7im55AVzspzFv/Kvr3whz8kQHUGMDdtZsDRAVdcpTCEQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794343981;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-SA-Exim-Connect-IP:
	 X-SA-Exim-Rcpt-To:X-SA-Exim-Mail-From:X-Spam-Checker-Version:
	 X-Spam-Level:X-Spam-Status:Subject:X-SA-Exim-Version:
	 X-SA-Exim-Scanned;
	bh=sj0Whl/89JY6Kb2SPM0Ywlt2A7Oar2XKaSLTpblYumE=;
	b=Bl5EO8tESmIpRvLx8SaAXAN9XSiOoe0KL/Y9VUwLk2PnAqpR4MwGyO3uUCyhbay5xGLu
	 YaBxAQ201W2vrEktq1fqHQjn/BTrcLf64z5IHqhBGtMhZLcR4Qkb6tZ7YdcPPLln0ipP0
	 sYheN0rifgQrbah5YYHCDTq26Cd96Ma4YmryEvFFTP23ZoMq4BdZV6r3pCj7jvs4bnxRl
	 yKvSRSSjgL5Hoi9Z8tSF0XrYbAy2Ijxys61OZNL/LURdPbAmUt3xgCvQ+B4pc0QLSNFpE
	 9CSKRg2YOvw34WdN/r8QA2Pk3ZRNLDUB5yKsCZubDs3iSDfAmEY7sLZywHK1VF6U8VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deltatee.com;
	spf=pass smtp.mailfrom=deltatee.com;
	dkim=pass header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=JwbRkytT;
	arc=none smtp.remote-ip=204.191.154.188
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD58B606A321;
	Tue, 10 Nov 2026 20:53:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD58B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deltatee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=JwbRkytT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:In-Reply-To:From:References:Cc:To:
	MIME-Version:Date:Message-ID:content-disposition;
	bh=sj0Whl/89JY6Kb2SPM0Ywlt2A7Oar2XKaSLTpblYumE=; b=JwbRkytTJKcfWT+TPErQoNLme2
	buBo4nu/X49N8oBH4t3vC3ShTSqHcho96pki57P+jF9O8Qfhz2SjODqMiqWSyehIleZZbOXz3k6Pc
	wmdsdmOy5LHgewwtzFLSptJIG/Uv72kD1HACuDPm9Tirb227vLwzqRl6Jfgc6JFuFDh/Pon5PE8kw
	2k707S+kJDr8R8uACHXRLgOVxMjvPG2Fj2tRvfdDyyWRNr5XpjQB1M/98gPohvFA5miU7bjXE9z5Y
	/eE+THG1GlXAiM8Ac5c/0vDsrXghfSYunjBqAvvoqzGW5dYChbqCyQJGAgopsN6Kb9UvTXhyZ8QgM
	FxKc7abA==;
Received: from guinness.priv.deltatee.com ([172.16.1.162])
	by ale.deltatee.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xQspv-00000000qZp-1cWb;
	Tue, 10 Nov 2026 14:53:00 -0600
Message-ID: <8f0b5056-67bb-4e88-9ebb-3766edc9c841@deltatee.com>
Date: Tue, 10 Nov 2026 14:52:57 -0600
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: sashiko-reviews@lists.linux.dev, dmaengine@vger.kernel.org
Cc: vkoul@kernel.org, Frank.Li@kernel.org
References: <20261110173927.624629-1-logang@deltatee.com>
 <20261110173927.624629-3-logang@deltatee.com>
 <sashiko-outbox-207537@kernel.org>
Content-Language: en-CA
From: Logan Gunthorpe <logang@deltatee.com>
In-Reply-To: <sashiko-outbox-207537@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: sashiko-reviews@lists.linux.dev, dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Level: 
Subject: Re: [PATCH v2 2/6] dmaengine: plx_dma: fix descriptor ring leak in
 alloc_chan_resources()
X-SA-Exim-Version: 4.2.1 (built Sun, 23 Feb 2025 07:57:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)



On 2026-11-10 11:58, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Low] dmaengine: plx_dma: missing Fixes trailer for
>   alloc_chan_resources() leak fix
> - [Low] dmaengine: plx_dma: duplicate cleanup in plx_dma_free_desc()

Makes sense, I'll queue these changes for a v3 next week.

Logan
