Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B634A3D21;
	Thu, 10 Sep 2026 14:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789049213; cv=none; b=XvYRBycK4GzEprkoY8SLOiH//7VUwHSHbMu1dmz3g4why/4TsIMdg65eXf7Zl/PxrwPKnOp+Ez29DaIUM6qdxr9PU3Sj3IBzMtCkOfmLTWGFgAIp8oBB3Gi0vycoakKlO6KPpT2QLiDKiSbF34R2w4/+xkYC0LVDlvSC0lbIv4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789049213; c=relaxed/simple;
	bh=gHmmDFYXcl4BFQ6ooprpIeIdGlWv/6M3F6KrXoLY4AY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pifZvMd9hPdmM9MLnmDB2swt5EHoKxn8n3V87n/SUS+SHMG3iOIjzXw3e1uXWuRgTeZDiy82+OxMgVOF5VBpc7w+Fg/pjTt8Kw4Lyxjm7UkslEyKDvuEpPeaX+38tdk+eW1wjaL6kpJJmQRFIaJbR0QhUfghl+q88d9IZLHVKrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k+OhKHMj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k+OhKHMj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 724A81F000FF;
	Thu, 10 Sep 2026 14:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789049211;
	bh=CBqu5VqU+X7aB+8c5EeB4WIxVldGwxAwHMHbFNnCBOI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=k+OhKHMjvkpwfk9wSOyKmv6Z+oyVQipOnoqJhhShlmbZqLluZUAa19j0d/WXM+Xhx
	 Bg9zv76j7tpgWZfTX/LVpjMbWEAFG74APsmo3Aoc+3D6aCEMepvoXgajNX/qmeXIpz
	 nbfRhJx8z7nySUq2weHJVtF5FLVlW6PnPVfxXybMzroCQfPtQsNrsSDUiM1SOKjTY5
	 KaZ2e+jzxCYDMH1PBDVP9kg2X9Bq895+fVDrGLbO92Yon4RKmoZudD363uT73XzHaZ
	 /M9zMXs0VxgsgRbTupQwqtq1k2IqaumkRuH549jPJKL/laolSC0FdqyjRHh/e5S5nW
	 /1bzpuWEFo8Ww==
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 Kedareswara rao Appana <appana.durga.rao@xilinx.com>, 
 Alex Bereza <alex@bereza.email>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260817-fix-hw-buf-desc-reuse-v1-1-d79827a844c7@bereza.email>
References: <20260817-fix-hw-buf-desc-reuse-v1-1-d79827a844c7@bereza.email>
Subject: Re: [PATCH] dmaengine: xilinx_dma: Fix hardware buffer descriptor
 reuse order
Message-Id: <178904920902.109109.8238525405953023415.b4-ty@kernel.org>
Date: Thu, 10 Sep 2026 19:36:49 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Mon, 17 Aug 2026 11:23:55 +0200, Alex Bereza wrote:
> xilinx_dma_alloc_chan_resources() builds a static ring of hardware
> buffer descriptors once and the driver uses this ring throughout the
> lifetime of a channel. This requires the allocation order of hardware
> buffer descriptors from chan->free_seg_list to stay in sync with the
> hardware buffer descriptor ring built at channel allocation time by
> returning oldest descriptors to chan->free_seg_list first.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: xilinx_dma: Fix hardware buffer descriptor reuse order
      commit: cee9c863ee68cb27d66745eb03f60e357f4f8ad2

Best regards,
-- 
~Vinod


