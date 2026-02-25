Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F68E392C31;
	Wed, 25 Feb 2026 11:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772018641; cv=none; b=KUrjlxYmI+Cq1sQR7TKWFwRdkSKQjIcRG0tM2V2L/L6KO2g+J2ClZNE/sdq1nVDPf0DxQ2pywH1tird6ULS/jWC1DLHDn+87NEVybcuK+gn7SCUK1/7TezyhCWT/ILw21O7muRaGC1XUqqbYWs8/hhNUISXFLKdMlJPk8Fc2QTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772018641; c=relaxed/simple;
	bh=0Ef/0nls1pisIbmcaBsc8YPx1zgEYlaXxLw1AYOR7DU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=b5qZFuOFnxjJMk/+055y4KK+vBt/t4d8e+4lr7x7y/79Q/Rg0dFguygS7R9ETTj4DPBkNoHQdi8xl1ry5wPjUpPPeoYmKEeYDbbBNlrHiHc1xFjzgULaEyZo9llrC+tilcmQrG7Sfk1ZlBqM7oabDHrW9+Mx3QLW7BI+KVuIZ38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i/zEyutA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i/zEyutA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30E85C19421;
	Wed, 25 Feb 2026 11:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772018641;
	bh=0Ef/0nls1pisIbmcaBsc8YPx1zgEYlaXxLw1AYOR7DU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=i/zEyutARgWZ6yth0I7OISzFxVRbwA1O/XuV/AKDBUqahMiuRmSskFrIp2jWMIMWW
	 OeyjUNp360eV2MRkTWab6EvaN4j4eue/8f+xxw6ljWdYWkuplQZ+RaM6E5by8ynP7v
	 bOSq6wIdlGRsdroYLsMbqxVfHEQhzhK2p37DqXO3HKIj207hvQWv3hLjaJZ8ZnUrod
	 AwO/xuHkmsksKmQShA5P0Cy+WoB0yo4WA52zIDAbuoGBEUKhrprwhA4T6EfzGD9wx+
	 TdJlxqL+CLZu/Nma//NExwWAuFlIDppeG+HLwXh/82RSrYQy+w/oLfEn3xEsMJ6zfj
	 h/fjmlifXoEAA==
From: Vinod Koul <vkoul@kernel.org>
To: Frank.Li@nxp.com, Zhen Ni <zhen.ni@easystack.cn>
Cc: imx@lists.linux.dev, dmaengine@vger.kernel.org
In-Reply-To: <20251014024730.751237-1-zhen.ni@easystack.cn>
References: <20251014024730.751237-1-zhen.ni@easystack.cn>
Subject: Re: [PATCH] dmaengine: fsl-edma: Remove redundant check in
 fsl_edma_free_chan_resources()
Message-Id: <177201863982.93331.18424024162495140615.b4-ty@kernel.org>
Date: Wed, 25 Feb 2026 16:53:59 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 14 Oct 2025 10:47:30 +0800, Zhen Ni wrote:
> clk_disable_unprepare() is safe to call with a NULL clk, the
> FSL_EDMA_DRV_HAS_CHCLK check is reduntante. Clean up redundant checks.
> 
> 

Applied, thanks!

[1/1] dmaengine: fsl-edma: Remove redundant check in fsl_edma_free_chan_resources()
      commit: 490c367b5fbcba6bb653077312c8ef477adf79b5

Best regards,
-- 
~Vinod


