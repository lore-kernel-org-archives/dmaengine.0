Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC754F6497;
	Thu,  3 Sep 2026 17:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788455091; cv=none; b=bOWrAE6MF6GlFuF0ycIR0iO2MMIZ8zizdWg1ciyDXCzQK2u2WVdCPhuUdoGg8VS56gvPtgC/Lxi3Y4SAMcBz2uaGSzcN3jTSrlq3BVly9GXKZ+ct3yQFOvD8EYX9L7uCVBcTEOZkgDNQurnYggpw+sa9PXy0XKapkhiKwDh/Izw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788455091; c=relaxed/simple;
	bh=nARpbtz4Kk9BEX2f2UYDi15bvaaW9aUwTNdBQnHdYxk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=q6OoVCYANS+ihjp09rEl3biTOn3Ku0323GDXxk4y9s7OP4z6BZn629roLAfs2GM7k3GO11M7Dqy/s04UhBTB0vRQQJZx0c3CYj1Pu7YqjoM4WGiZgIViyY+8QyJ9v6zg8Tw8wpuL/jREw34v+t95/oWkvdwBEg4f03g0/SEK74A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ARjcVxUN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ARjcVxUN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44F861F000E9;
	Thu,  3 Sep 2026 17:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788455089;
	bh=byEEfCh4k6tf1ei/oxgQXIrGO+jggmsx3IBWPRS/rd0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ARjcVxUN9wjhX/Xop09geMJORhlpOEJIkBXnXNr3F6iGqnA0b7PvsUm41nkqyt1Yh
	 aYiZXzhXiX+LXgL6OXwTbThP5EOX75hqVc8SITrq3s2RXcay3u27cyfnQZnQivl1UU
	 HdteGIWVlt03AK9Vbr07EakqpD4mI0FyWY28+jcn9r49n1Zvea5AmWiGe0GFJJa28u
	 Aps2JYOGwScv+9QODQXnrbj9kE846PZGWvLR3gim43h9K8P+RKjyRAbxWZ3IMd7p4d
	 1IKC1SHOGI8f5yl3U12B9l29gZGw0vkwm9GVBaBFQOVHqRZ6pkAb8L1yfy0nGEjsvg
	 kAtEblfSEujkg==
From: Vinod Koul <vkoul@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@kernel.org>, 
 Vladimir Zapolskiy <vz@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, 
 dmaengine@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260726102424.547951-1-vz@kernel.org>
References: <20260726102424.547951-1-vz@kernel.org>
Subject: Re: [PATCH] dmaengine: imx-sdma: Remove unused imx_dma_is_ipu()
 inline function
Message-Id: <178845508682.1711546.16165928798179926266.b4-ty@kernel.org>
Date: Thu, 03 Sep 2026 22:34:46 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Sun, 26 Jul 2026 13:24:24 +0300, Vladimir Zapolskiy wrote:
> The last user of the inline helper function imx_dma_is_ipu() was removed
> by commit bfac19e239a7 ("fbdev: mx3fb: Remove the driver") a few years
> ago, and this helper also can be safely removed.
> 
> 

Applied, thanks!

[1/1] dmaengine: imx-sdma: Remove unused imx_dma_is_ipu() inline function
      commit: be9bb4b4a3c4611ecfbe3d785894a09d331c6f25

Best regards,
-- 
~Vinod


