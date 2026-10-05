Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88B94C6536;
	Mon,  5 Oct 2026 15:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791214981; cv=none; b=GWA7xLRvFTZeLHmMKf51Xv1t5lugitbL6RN0KHkgEqBstX9o3/JI0ZDiBueD7+TUtlJEPNSFm76ZvQ+HB5n+eMRQIzio1rtX5UzkBkiYlu27ug8fLNo2RspmuIFXIV5l4yJDYxfVPxn+BDzz+/Fn/lRPcU/DwGmXDUFDVKpJV0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791214981; c=relaxed/simple;
	bh=BeiSewCi4xzTzZdIRzqoIb73hNE6d2N/Cjw+UAIx6Mc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dCUitUBI8iTTgpNjAN0jWdnzpsQyHR8gI+sXHYBHrZ6ut265u//bg/oJm/pTu1dPqWYvccQdRSJZwCdQalwV2KnrhTJMvKSjaJ8yMVaG50+16QkPK97C4U/51RhmLUVXifYUKU91PBIcPCTwCR6Ny1ThaTtSYfPwMz676GKVIAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CamOUFRw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CamOUFRw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16A2D1F00893;
	Mon,  5 Oct 2026 15:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791214979;
	bh=ltm7r/kAP669B4CNLMlPS6QVnybnAFHJtfgXOvrMNu4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=CamOUFRw6YpKj4WKTIMOm2ugl1Ek42tTPtTNeUv7BJHluNeN9R44YPNyapZOs6cmx
	 CxYIa69llnVUk7uoMM6+alPG8uNZevWcfr+wdadWGre/EvGOBBuf221a9HyzOmm9Zt
	 9zIwRNYWG4lPViff/VlcQ61IL6alP2wwOKT9h13yf+eUGiawhBZpAU3xheZUF7kfZD
	 IJ93RmPX8TJvgvxDknnFnr7BGlK0uP1wxfGexBLHOqnfxG+tqfsqaGpsMZ/N18WRNd
	 w3mceIDkiO+XljUxfGpVW+rdZItQczO5D+fxBiZx4xcfIR2DWhVkqPzeKrN0BsWX97
	 jnqQG8BskKkow==
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>, Andy Gross <agross@codeaurora.org>, 
 Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
In-Reply-To: <20260717-qcom-bam-dma-irq-trigger-v1-1-6405eac86f00@oss.qualcomm.com>
References: <20260717-qcom-bam-dma-irq-trigger-v1-1-6405eac86f00@oss.qualcomm.com>
Subject: Re: [PATCH RESEND] dmaengine: qcom: bam_dma: Defer IRQ trigger
 type to device tree
Message-Id: <179121497772.358863.7129653895663083577.b4-ty@kernel.org>
Date: Mon, 05 Oct 2026 17:42:57 +0200
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Fri, 17 Jul 2026 10:30:28 +0530, Vishnu Santhosh wrote:
> The driver hardcodes IRQF_TRIGGER_HIGH when registering the BAM
> interrupt, which overrides the trigger type specified in the device
> tree. On Qualcomm Shikra SoC, the A2 BAM signals an edge interrupt
> to the apps processor; registering it as level-high causes the
> interrupt to not fire, resulting in missed DMA completions.
> 
> Use IRQF_TRIGGER_NONE instead, which causes the kernel to use the
> trigger type already configured by platform_get_irq() when it parsed
> the device tree interrupts property. This makes the driver
> platform-agnostic.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: qcom: bam_dma: Defer IRQ trigger type to device tree
      commit: 3cee6f79553202d7d3954555560ac38d719344b8

Best regards,
-- 
~Vinod


