Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743D3381E89;
	Thu,  2 Jul 2026 15:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783005932; cv=none; b=FtDCvBOECzOAr7lZai1dtvhDUjVYFAJGBbaZTQ6TsXC+/X3Ky1Al5Eih26OTlvNmfgNJGRJyQTGG2/euMgQwje5Iqy/pdJ3/Ze+stEPXdWswoFib+kAWAsgqyXsbvV6rOzWfEhjRaR6ByGJrVIKbDCAIXeoiBalYNPt8Sqsgx98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783005932; c=relaxed/simple;
	bh=/XEr68Ab70OWUPgB/b4jZQF+7hBnpfA+l5X1ad/e+QI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=th4NhC48spC77Le2cg6aYwquqpv9LUD2Mn8QTHK8oS1C2PCXLhsfQXwNLvfne72l0cNviE6+9Z1+3bs0g9Rx8usAuqAPi3gmusdJQSU6tshVqG4EpmJprxsIwy4v5I8Ce8jffbZQqCXYypIITCwt/qQwcmRg4mLYGooy8gOQ8GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mld9zIRz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mld9zIRz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 756AF1F000E9;
	Thu,  2 Jul 2026 15:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783005931;
	bh=hh1GKcBgtMqoFUkB0LHwE/UJFOYQ6UKfpRoxk/RQ+SM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Mld9zIRzBnjiFW5lin9TsanOqPeEQE/KwS0c4zVNixDNe9FKNlqenqFcbXoKAC5n/
	 YFeVMaEY/nH0xqToUjpnejqS0Ru87jW9UkZmpHJJF4cW6FT5jiQ96MBEJnrSj4grbC
	 d5DJmELYFnr9KcZdzQjBYq4Sz0LhEiqqTafLrAC6l8kfXgZIdRCt8GY4+YyIfK+n2G
	 OKYxbHteRSxxXJSRqfOWB9FySj5aKkHuxsqGL2XOefEybA7XRYaGfKYFJcLOIbxqcZ
	 HZDJoGt3I508Fb4WEkMcFdgm1AU8VBbyZR3Co99O3EQ1V13+qcYW2HKaSnT3WYFQ9A
	 Urn/jSXMqhrHQ==
From: Vinod Koul <vkoul@kernel.org>
To: Frank.Li@kernel.org, wens@kernel.org, jernej.skrabec@gmail.com, 
 samuel@sholland.org, mripard@kernel.org, arnd@arndb.de, 
 Hongling Zeng <zenghongling@kylinos.cn>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 zhongling0719@126.com, Frank Li <Frank.li@oss.nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20260701045733.33654-1-zenghongling@kylinos.cn>
References: <20260701045733.33654-1-zenghongling@kylinos.cn>
Subject: Re: [PATCH v5] dmaengine: sun6i-dma: Fix reclaim descriptors while
 terminating DMA
Message-Id: <178300592710.726714.11534436321396496964.b4-ty@kernel.org>
Date: Thu, 02 Jul 2026 20:55:27 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Wed, 01 Jul 2026 12:57:33 +0800, Hongling Zeng wrote:
> When terminating DMA transfers, active descriptors are not properly
> reclaimed. Only cyclic descriptors were handled, leaving non-cyclic
> descriptors and their LLI chains to be permanently leaked.
> 
> Fix by using vchan_terminate_vdesc() which handles both cyclic and
> non-cyclic descriptors by adding them to desc_terminated queue for
> proper cleanup.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: sun6i-dma: Fix reclaim descriptors while terminating DMA
      commit: ab1150115e68a46b687eb38c1ab92782018c9f2c

Best regards,
-- 
~Vinod


