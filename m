Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795166260;
	b=YxCnrQcXGOmCgET9fQsWdCrn7gy7CF3uYX52lpmEmtUmV1hL5wTjATurb2pZNIjvwIVn
	 YFzqw0VlvirH4f+Tyj+pju6EZWnLkQm7bcMdC2x7kBqO4jQ/Cjp0jAYdES9OCCFL7Sbkn
	 WgaRLcoxtAJSsAj5kyrBuQWvMB/dC/f9gQjr289VoU/g9GYfXmdiziaVZjLQdJ4oNsbTt
	 Dtd3PIluFjxU5PLXu+3m/PTaKDGGEUFj6kEHymUQi8ZK8090N6mw7Aj/jEdMDR56Cc6On
	 v9dfQJlhuF7MoaNEkqIKMHThtVYV/Bay78RpCZXkcUkj0v8M9FX55CgjDKOvo6RkcbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795166260;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=mM5+FINgcGnSuhncd5/SWe1qnRlHM0gn+tpvRm/HiRM=;
	b=fyMX1yWQwxVV5E/vsynNpe3BoJLZDN0II8zxHUBX9kw6eS263KSVy5nl6+jIkhHyVtmb
	 CF4Mrc3mdLvum7mfDT3Nk7gdMub3156S2AchfEL17Dt+i3eV4/1ABAC85mrMmHM6CIlze
	 OPKQUSblOEeVDL42PDj/NK3nzj4dmwOOGIEyUfNNUKDd7Rd6ei+zxTIDWv/X2CJpUu6Kg
	 digMgrCRIaUe+T4J5UmB+Lq+hXDatMog6c0pThXD+kYlu9XLJ1ulmEdNM3+wS8/FtqUg8
	 VOzDCu9K4asSd9D0edmKhSW1sr99ccdFSZ8dwshX7QjTMkUPpT7cPRJGXUrwwmfY6MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bMA2jOPU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680F9606A320;
	Fri, 20 Nov 2026 09:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bMA2jOPU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4495A1F000CA;
	Fri, 20 Nov 2026 09:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795166260;
	bh=mM5+FINgcGnSuhncd5/SWe1qnRlHM0gn+tpvRm/HiRM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bMA2jOPUlhYBstSf/UF0Ib9QxgeL8Ap9qLIcbi0eOg5RTGdSqQNkTNSz2hrTaAGkW
	 y+rjRvRjYZ8Mlcs4xRI511BSpfcBQb0vizIPnkbf/kNSxDgnrUDpMRaDUyiBZuncBo
	 3gHDn64h5kyyrkzI3xZ+5o3X8tifqCdJrUEm8Q5xa6Mwv31otSqPed1iMDc2uaJXLK
	 nQHielSc6JOk7RilqTFQX54Xf+Bjqt8g6tm7XK1jUpBM5IkldNyS2u1MuGgaQJHI8o
	 EZLQ2hr84cdZZMAgvBahfnK8rD4ZhyUd5ebAF+OX2l4nlXObx8CWcMoWiKdRaB8iQL
	 cmowUidy1e6dw==
Date: Fri, 20 Nov 2026 14:47:36 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Frank Li <Frank.Li@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv2] dmaengine: ste_dma40: allow COMPILE_TEST
Message-ID: <awAQMEu_OULFyBpl@parshuram>
References: <20260917232930.128927-1-rosenp@gmail.com>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917232930.128927-1-rosenp@gmail.com>

On 17-09-26, 16:29, Rosen Penev wrote:
> The driver only uses portable kernel APIs and AMBA bit-field macros from
> <linux/amba/bus.h>. Allow building on other architectures via
> COMPILE_TEST for wider compile coverage.
> 
> Also add missing HAS_IOMEM as COMPILE_TEST also enables configs that
> don't necessarily have it.

Have you tested and verified that it builds on diff archs?

-- 
~Vinod
