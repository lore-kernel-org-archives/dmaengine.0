Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4EA4F6477;
	Thu,  3 Sep 2026 17:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788455084; cv=none; b=M3KUqD+nyZpMtTuL+rtiHeDXoloML56ur8JoiWWdcF7S2G5Ew00Pa9kY9g1xl/NvDY2NMleHLZKyP7/PC0N+M2wL5RGxB+DZKTLb4jPZm5XEyA/EploRZGOAJ5M+ik3NEIpharjq12ZnUMGBobp+q03EaEc/O9h7exIXz+/39ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788455084; c=relaxed/simple;
	bh=AYl6JvZMEZ/QoHcOGPv26ZEqWeGffZSO4uuFdiGbNsI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Khr+DG9UOWA27sZ8BF1g7HXjE1j2SFhZ/3ViTarI2FJvrcnV3qVYAN9F9lwtwArb/1m9URaP8Pm62rbQPfDl/IANu8sufVy2q3au61wwfPojkigld1O/6r/YQQjOViNeZbA/2KP901BSErCEt62pLqvwG/ZLO1M3NAAzltyh5Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oBnv8rhE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oBnv8rhE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AE451F000E9;
	Thu,  3 Sep 2026 17:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788455082;
	bh=IoLH/hhN9t2gCsFXAHpa1BHsHfqKZHWk++1GVr4n0bI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=oBnv8rhEodtCXyDWfOzmRB+rnPeUQjUPhuJpegQHEHhth2Hav0I1W1aABsNjvhneB
	 8rJvbS36xEMorJ2FF8z5CG9Hued3/lPeq6vxDdBXkb3LaLwITN/2mFDCE89m4Lk5EJ
	 liEYUzYROIsOE+NxhB8y5jD90xGQq4Ui+HwhYeYBQxbxRmC76+p4FwygalW1wYN29h
	 d7Sovp+Q1y2krd3i3bRPR8QawhZQnixEWEc4J859QqMMXPbJEf4HqpDqifLSoxRRPR
	 ZaaLuEO5iGQCY396f3THhdu5UoquFFKgRMhFKO8h1GeC+a2HgGw3NYZ8Fc4BmiBnPs
	 HMpIPw/6VP9mw==
From: Vinod Koul <vkoul@kernel.org>
To: ludovic.desroches@microchip.com, Frank.Li@kernel.org, 
 tudor.ambarus@linaro.org, nicolas.ferre@microchip.com, 
 Hongling Zeng <zenghongling@kylinos.cn>
Cc: linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, zhongling0719@126.com, sashiko-bot@kernel.org, 
 Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20260727061705.45169-1-zenghongling@kylinos.cn>
References: <20260727061705.45169-1-zenghongling@kylinos.cn>
Subject: Re: [PATCH RESEND v6] dma: at_hdmac: Fix use-after-free by proper
 tasklet cleanup
Message-Id: <178845507904.1711546.7183586519826680915.b4-ty@kernel.org>
Date: Thu, 03 Sep 2026 22:34:39 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0


On Mon, 27 Jul 2026 14:17:05 +0800, Hongling Zeng wrote:
> Current cleanup paths have a use-after-free vulnerability:
> - vchan_init() creates tasklets that access at_dma_chan memory
> - free_irq() only waits for IRQ handler, NOT tasklets
> - atdma is devm-managed and freed after probe/remove
> - Running tasklets accessing freed memory → Use-After-Free!
> 
> The fix requires careful ordering:
> - free_irq() FIRST to synchronize with running IRQ handlers and prevent
>   them from scheduling new tasklets
> - Then kill tasklets to wait for already-scheduled ones to complete
> - Only then free other resources
> 
> [...]

Applied, thanks!

[1/1] dma: at_hdmac: Fix use-after-free by proper tasklet cleanup
      commit: 00c5236057e36e88d3aca7246dd891cb56b513a7

Best regards,
-- 
~Vinod


