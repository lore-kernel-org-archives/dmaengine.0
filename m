Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6B53BA225;
	Tue, 15 Sep 2026 17:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789493796; cv=none; b=s5Nr4CvJCHv2umpbqYjVNeHl9hYyI39LkXaPEf0fIPl8DDRl+f+p/yNafocTa0pUUizLG7KtmlirnIyJuJNC0NCqLVV2cUTf2f+AUxrffqXoWyPThMtu+NYx/PZ43ChI3DYLFGhPtjlR+Os0U+NsgoXxXFrv/dIdKRqOdEsMlNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789493796; c=relaxed/simple;
	bh=NhdSsQ4ingVjVrK2juJuET+d3pv7JHxJjQDy8tLTOd4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=H+K0LoxvoscLISnIUrTzrkbo0vbee+Xu/OBezK/oi7203vT+efmBqt6qaFv2iBbJvrww2XOt3jy8h7q3nk3rfbc+AxWeMX35V2SVnd61oHMjnou+0vnfmnJm55bsBtpv5vkUo5QHA9uDvw/ClWBwElIqRCl6zfrmr4Gj5Vmoipc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XQOAcNMo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XQOAcNMo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EE2B1F000FF;
	Tue, 15 Sep 2026 17:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789493794;
	bh=1JyX64dsNGnurU1C9rEoj0vZTLpcO1EQVLIs2Y0KcBY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=XQOAcNMoxlFwdN3vBzRaryF/OV14+ZMHMMs1qi0Q63bs+imbFTmP+J4ReG358hpUL
	 nwd+onUxAldMZnXxHrU6VwyoGrPkDP7QLeGAQ1jMNFqiOCNdbPPtawmmZO0YMfGPjZ
	 ncX9tOaEbCxulaHzobogssneLBh/syVbcrpWxgT71VpcfwnIxhPE6JXcQj450DF8cG
	 m7iQFzFs9UXxRLfOGl7G7+SovN36wJKSGf0LgtnZD2A76c67S5YsGS9xbxyTqr1eVQ
	 DZ8u4d8YM3OxpDS0Xx/YotE33OrltGcOpNVJF0eNeMsb5BI/oF0v2pK0IJJDe9tAmr
	 VFDI3ynlEeqOw==
From: Vinod Koul <vkoul@kernel.org>
To: frank.li@nxp.com, Slavin Liu <bolin.liu@seu.edu.cn>
Cc: imx@lists.linux.dev, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260911060902.94153-1-bolin.liu@seu.edu.cn>
References: <20260911060902.94153-1-bolin.liu@seu.edu.cn>
Subject: Re: [PATCH RFC] dmaengine: fsl-edma: check channel acquisition
 before use
Message-Id: <178949379263.248239.2249782721178774310.b4-ty@kernel.org>
Date: Tue, 15 Sep 2026 23:06:32 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Fri, 11 Sep 2026 14:09:02 +0800, Slavin Liu wrote:
> dma_get_slave_channel() can return NULL when acquiring a channel fails,
> for example if fsl_edma_alloc_chan_resources() cannot request an IRQ.
> fsl_edma3_xlate() dereferences that return value to update privatecnt.
> 
> Acquire and check the channel before publishing its source ID and
> request parameters. A NULL-only check after the existing source-ID
> assignment would leave the failed request marked as in use, causing
> fsl_edma_srcid_in_use() to reject a subsequent request for that source.
> The channel resource-allocation callback does not consume these request
> parameters, so set them only after acquisition succeeds. The existing
> scoped mutex release and successful-channel return are preserved.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: fsl-edma: check channel acquisition before use
      commit: bfd958664fccd794377a8adb74b492498c824643

Best regards,
-- 
~Vinod


