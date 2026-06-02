Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E03233941;
	Tue,  2 Jun 2026 13:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780407054; cv=none; b=i4mFyqlV4VWuZgAJABEttyBatww1cN+FnBWaKqpqk9D1I2QA3qwnBRbtGB35lY2y/qnmHbME0jsH8+FRL5kwXomxvrGa+pdwrWn0KuWimya1OHSYoh5mjojHwnfzyKQwhqo5SmOlVNk3X33qNG8C8uDIv+0TC2MV39wJUP3SJiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780407054; c=relaxed/simple;
	bh=WnoCYYY2O9xdTYGKzcRY4YVB5VH1xlhm+ELi8P1QuIM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J0YXY6UqTjyo8JB/89gFaDfr2GJzQcdQkSCcQIV/n7aN9fusrLGhY5EA7HlsESenweLVQTFrtl673nfcocAeAdUSodaK6MQAylMhzKHCyup242eT9lObmVBZ31vYfISumTQitPLkSoq+6C+kA+e/lfaD3KE77qkw/5cNYnlcLlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cWxipr1D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cWxipr1D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD1501F00893;
	Tue,  2 Jun 2026 13:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780407052;
	bh=LPGoqrF6mb31SwqNmGzzMqxaVZZ8znhqb4FkUA/VCz8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=cWxipr1D62ketjcWQHp6nNED2Wmoompy3wuVag1agy1YlyiB3s4WiamHmW6b8d8f3
	 1yD2BRNTAteW7+MDmYHZRdfdHf8du/YyVlmwrm4qRyJtqow/sSmgUcFDpVWuw+MtvR
	 araYop00eGUzJNx31nuneRZZMJ6HwEv2tEORdQVbyiSgQZ5tixZKF5zkRNIHb2GqIZ
	 zSW/gqMAycpZrGfVqoT+YKOytAN9Zbfz+56EtCx4WW8941NAJO//JeqgrHQLtalpb4
	 ysqff86AgezehekBpCTN58qCIdOtrfdMpiGQgHQi5LhQNDgWhsa3X/18M3jaT8F4NC
	 WXIXczCGQBnIg==
Message-ID: <8bfee508-9d3e-47ef-8542-cda6cf28847e@kernel.org>
Date: Tue, 2 Jun 2026 16:30:47 +0300
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/18] Renesas: dmaengine and ASoC fixes
To: vkoul@kernel.org, Frank.Li@kernel.org, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 p.zabel@pengutronix.de, geert+renesas@glider.be,
 kuninori.morimoto.gx@renesas.com, long.luu.ur@renesas.com
Cc: claudiu.beznea@tuxon.dev, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20260526084710.3491480-1-claudiu.beznea@kernel.org>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <20260526084710.3491480-1-claudiu.beznea@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Gentle ping on this series.

Thank you,
Claudiu

On 5/26/26 11:46, Claudiu Beznea wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Hi,
> 
> This series addresses issues identified in the DMA engine and RZ SSI
> drivers.
> 
> As described in the patch "dmaengine: sh: rz-dmac: Set the Link End (LE)
> bit on the last descriptor", stress testing on the Renesas RZ/G2L SoC
> showed that starting all available DMA channels could cause the system
> to stall after several hours of operation. This issue was resolved by
> setting the Link End bit on the last descriptor of a DMA transfer.
> 
> However, after applying that fix, the SSI audio driver began to suffer
> from frequent overruns and underruns. This was caused by the way the SSI
> driver emulated cyclic DMA transfers: at the start of playback/capture
> it initially enqueued 4 DMA descriptors as single SG transfers, and upon
> completion of each descriptor, a new one was enqueued. Since there was
> no indication to the DMA hardware where the descriptor list ended
> (though the LE bit), the DMA engine continued transferring until the
> audio stream was stopped. From time to time, audio signal spikes were
> observed in the recorded file with this approach.
> 
> To address these issue, cyclic DMA support was added to the DMA engine
> driver, and the SSI audio driver was reworked to use this support via
> the generic PCM dmaengine APIs.
> 
> Due to the behavior described above, no Fixes tags were added to the
> patches in this series, and all patches should be merged through the
> same tree.
> 
> In case this series will be merged this release cycle, as the audio
> patches are acked, best would be to go though the DMA tree.
> 
> However, there might be merge conflict on the rz-ssi driver due to the
> recently posted patch at [1].
> 
> Thank you,
> Claudiu
> 
> [1] https://lore.kernel.org/all/875x4agb2x.wl-kuninori.morimoto.gx@renesas.com
> 
> Changes in v6:
> - addressed sashiko review comments
> - addressed Frank's review comments
> - collected tags
> 
> Changes in v5:
> - dropped patch "dmaengine: sh: rz-dmac: Do not disable the channel on error"
> - added patch "dmaengine: sh: rz-dmac: Add runtime PM support"
> 
> Changes in v4:
> - collected tags
> - addressed review comments got from sashiko.dev. For this:
> - added patches:
> -- dmaengine: sh: rz-dmac: Move interrupt request after everything is set up
> -- dmaengine: sh: rz-dmac: Fix incorrect NULL check on list_first_entry()
> 
> Changes in v3:
> - addressed review comments got from sashiko.dev. For this:
> - added patches 1-9
> - added patch "ASoC: renesas: rz-ssi: Add pause support"
> - dropped patches:
> -- dmaengine: sh: rz-dmac: Add enable status bit
> -- dmaengine: sh: rz-dmac: Add pause status bit
> 
> Changes in v2:
> - fixed typos in patch descriptions and patch titles
> - updated "ASoC: renesas: rz-ssi: Use generic PCM dmaengine APIs"
>    to fix the PIO mode
> - in patch "dmaengine: sh: rz-dmac: Add suspend to RAM support"
>    clear the RZ_DMAC_CHAN_STATUS_SYS_SUSPENDED status bit for
>    channel w/o RZ_DMAC_CHAN_STATUS_PAUSED_INTERNAL
> - per-patch updates can be found in individual patches changelog
> - rebased on top of next-20260319
> - updated the cover letter
> 
> Claudiu Beznea (18):
>    dmaengine: sh: rz-dmac: Move interrupt request after everything is set
>      up
>    dmaengine: sh: rz-dmac: Fix incorrect NULL check for
>      list_first_entry()
>    dmaengine: sh: rz-dmac: Use list_first_entry_or_null()
>    dmaengine: sh: rz-dmac: Use rz_dmac_disable_hw()
>    dmaengine: sh: rz-dmac: Add helper to compute the lmdesc address
>    dmaengine: sh: rz-dmac: Save the start LM descriptor
>    dmaengine: sh: rz-dmac: Add helper to check if the channel is enabled
>    dmaengine: sh: rz-dmac: Add helper to check if the channel is paused
>    dmaengine: sh: rz-dmac: Use virt-dma APIs for channel descriptor
>      processing
>    dmaengine: sh: rz-dmac: Refactor pause/resume code
>    dmaengine: sh: rz-dmac: Drop the update of channel->chctrl with
>      CHCTRL_SETEN
>    dmaengine: sh: rz-dmac: Add cyclic DMA support
>    dmaengine: sh: rz-dmac: Adjust rz_dmac_chan_get_residue() to return
>      error codes
>    dmaengine: sh: rz-dmac: Add runtime PM support
>    dmaengine: sh: rz-dmac: Add suspend to RAM support
>    ASoC: renesas: rz-ssi: Add pause support
>    ASoC: renesas: rz-ssi: Use generic PCM dmaengine APIs
>    dmaengine: sh: rz-dmac: Set the Link End (LE) bit on the last
>      descriptor
> 
>   drivers/dma/sh/rz-dmac.c   | 823 ++++++++++++++++++++++++++-----------
>   sound/soc/renesas/Kconfig  |   1 +
>   sound/soc/renesas/rz-ssi.c | 399 +++++++-----------
>   3 files changed, 723 insertions(+), 500 deletions(-)
> 

