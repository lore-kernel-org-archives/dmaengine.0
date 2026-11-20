Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169088;
	b=3GpYc0BrU7re9DOzWaKHAKd1KLQWgq4Yxcz+irNi7gAzmccv6HEMd0VEV6+RfD5SYn41
	 OqNo4nDJmF7ujIVV8EmZyTRZmPGjUX33y2PYRo6+3l4AMkCQnUXiG0t3sXJmuu/JiKd1r
	 j4rE/lKG6Qftjajwe3tWCgrMolxtwYcOBwQggRFoBEjdcy4+ubF5ATy3FVlsvnmon0Npl
	 v0wkI+5MtyubGNlE8hWaxVBHkMvlCvkVc4m74pwNV+N6EE2uysjoYPxcUWe6BtYblPHpl
	 BTppPhBVZse0QKRK0MWWdLMVQ6EJArtWef5gihELbmLDcNaEZARGo1Oqio9TqGODcGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169088;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=UHJQKUsUUo6Jg/mW5vDhiO3aoYpypu+grhW/BJWllA8=;
	b=1phwaKmQrIxCgVzLjLaAaHz1CV6V/DbyHCNzJ0TmCLGJu8LwElGljpn/hwIHEZpk0uSv
	 RdHwkTF3js9pB5qVKyBC3K9J0c35voeAVPzb+WXEKbfVGlyE4D8eQaOnblWk7zpa72+27
	 TWP0/YLjBO8vaVwVEkVwIyeWYlxZKE3JhqX8hhWekDm85SSdapPmZEY3Qn4n48GQFXBWF
	 xgvlz5MaQXP143ngnLfXQ5czTDbtImyples/pZwigrlDTentJH3JxmtBHWm+tWLEOMjoM
	 wXIF/puoVjXMatbQHVs9pULPIAH053UvR9R5WO84FGkYDrmpUarb1NP8IbSIkFHSVBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V0tq2qH2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E3460A2615;
	Fri, 20 Nov 2026 10:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V0tq2qH2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12F931F000D4;
	Fri, 20 Nov 2026 10:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795169087;
	bh=UHJQKUsUUo6Jg/mW5vDhiO3aoYpypu+grhW/BJWllA8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=V0tq2qH2jRF7IFAc7NKRJDu19MKgLlFvI6mco2qz7e3ar5QB//qAGdhQgWc4bMZjU
	 yEEF++Wx4IwkFrhfKUcxI3gKiDYSIiWZ2GbvedkeZrDeqQmMA4Y+2XaNjzZ8+7Ga80
	 pQwnmOYEzkoif3zWUHoZrEzh/wqOU7Y6JT3smgmYwhMNnwgjfhKfP00XNt5fwInuCG
	 nCJES2zn8fTvlZrSaSOkjC8xEObYJBm3sSo52dKKKyOr5cWoYl7iv21ayRXbSBil/M
	 1YrvPcFNvr2J4DyOSxcwFJzyyP7F9dt1P+UtmvXke22l90zUtCgqRYI5J48ze2ctFg
	 x+pL5xdPh5+Vg==
From: Vinod Koul <vkoul@kernel.org>
To: linux-renesas-soc@vger.kernel.org, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: dmaengine@vger.kernel.org, Frank Li <Frank.Li@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
In-Reply-To: <20261012123020.11320-5-wsa+renesas@sang-engineering.com>
References: <20261012123020.11320-5-wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2 0/3] dmaengine: rcar-dmac: collection of small
 missed fixes
Message-Id: <179516908570.54365.12711269616105913018.b4-ty@kernel.org>
Date: Fri, 20 Nov 2026 15:34:45 +0530
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Mon, 12 Oct 2026 14:30:20 +0200, Wolfram Sang wrote:
> While working on this driver, I found that there were these small fixes
> contributed in the past but they have not been applied yet. So, I
> collected and rebased them, added review tags and minorly improved the
> commit messages. For v2, I addressed review comments. Changes are
> described per patch. Please apply.
> 
> Tested on a Renesas R-Car X5H Ironhide board and R-Car V4H SparrowHawk.
> 
> [...]

Applied, thanks!

[1/3] dmaengine: rcar-dmac: Fix PM usage counter imbalance
      commit: d3c108c095712a3b7eab292ef7ea9a57ff5cd5d7
[2/3] dmaengine: rcar-dmac: Add missing dma_descriptor_unmap()
      commit: 0ca154b10168d8874b871edf5510640c51b326c3
[3/3] dmaengine: rcar-dmac: Remove redundant dev_err()/dev_err_probe()
      commit: d460a02aa0ac6ba9e5d87f8462f75d78be83146e

Best regards,
-- 
~Vinod


