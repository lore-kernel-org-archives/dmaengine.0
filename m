Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD3A1531C8;
	Thu,  3 Sep 2026 17:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788455094; cv=none; b=JuGxDql7UMFVdDUVmPuxFRkE2b6tDTuTW0Wi+JH6vw0fjCR5lphdRjs8pjfiVWad6lh4+zLkSVRVHKJyKR4D/Iwhq663J0NsjCW+ZAlD8MJYU9pWK+7Wx4T2UZhO7pcckYgrvV48b+st1679/DLcCcS4c3craj7F6+KWqqu9Fsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788455094; c=relaxed/simple;
	bh=odN4C05I7BsurnbJgb+yDqra3AUbbVShIBlWyLvEPjM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NFq+c39lIizQzsMFik6R5y/O/fBwB53d7/2bda4+9VV7Yf8rWpo+O9YPlwyERqfVFhUNLvuuACks5OOKMTFRHCXP1/ozVsh8i7Wt28r+0jX18UfSweaazrloqBOiMQSisEWmgLbmF24D5DHIkiMQQmxuXVyDyv4JzvjUsl+TLAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jtOJsKw1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jtOJsKw1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72A211F00A3D;
	Thu,  3 Sep 2026 17:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788455093;
	bh=DilgdbLi0RvprvJJDhqDDjROWxRbnzwuVzagfLzpeH4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=jtOJsKw1Z6E1n2jwe18GTnTVkKTS2vbKwew94YlpSdbjnegpMFp+73VObcU5yL9bq
	 gAeS1O+aFWl4/HN1uL0kpq5C+u5SuWU4kB8prn8W9P860OGN4r2HTW4LyXWYscsQIL
	 yiZvFWdcZazUZgQqvdp1pzQJDUvnEx1cPS6mmXOP22X/vzE9ozU0SZEXM7hN7Ut9dL
	 n/4gZsX6OeMhdgiUqpO+An/opUPBNL4Cp5uRcb+JumsjijOMhT57j8+Qz0xO/sUn6n
	 5aeZPXM1JaA0uLv+trQFkCSSb8dHuFoqD3Ol2mGG48048P59DSLu16ZydCP/WdUYCJ
	 P2WZaoZQCsMQQ==
From: Vinod Koul <vkoul@kernel.org>
To: Sean Wang <sean.wang@mediatek.com>, Frank Li <Frank.Li@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Myeonghun Pak <mhun512@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ijae Kim <ae878000@gmail.com>
In-Reply-To: <20260804153924.49627-1-mhun512@gmail.com>
References: <aj1RSj5ZXvc-9yu7@lizhi-Precision-Tower-5810>
 <20260804153924.49627-1-mhun512@gmail.com>
Subject: Re: [PATCH v2 RESEND] dmaengine: mediatek: hsdma: fix runtime PM
 leak on init failure
Message-Id: <178845509001.1711546.16011623641876129813.b4-ty@kernel.org>
Date: Thu, 03 Sep 2026 22:34:50 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Wed, 05 Aug 2026 00:39:24 +0900, Myeonghun Pak wrote:
> mtk_hsdma_hw_init() enables runtime PM and gets a runtime PM reference
> before enabling the HSDMA clock. It currently ignores failures from
> pm_runtime_get_sync(); if runtime resume fails, the usage count remains
> held. If clk_prepare_enable() then fails, the usage count remains held.
> 
> Use devm_pm_runtime_enable() to manage runtime PM enablement, and use
> pm_runtime_resume_and_get() so resume failures do not leak the usage count.
> If clk_prepare_enable() fails after a successful runtime resume, drop the
> runtime PM reference before returning.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: mediatek: hsdma: fix runtime PM leak on init failure
      commit: b616eb4ef1e9358296a88a2fa7230dcfac52b53e

Best regards,
-- 
~Vinod


