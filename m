Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007133C060E;
	Tue, 21 Jul 2026 11:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784633103; cv=none; b=YaJ26knkNJD/Pl6TAF94WnjmbOEJg/EvMO1V66viLh8CQ1wHxFelnw3RcuX+hr2lISNLhE7FzIjXcNiXcBJ5GiZ2J/ASxus4gCHRJzex5uk5OOTGIviwiQmjMn/zv78+0+a0iF/P/AXoU6xc6ZMqFFiIjm8obugs44+QI7SVuLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784633103; c=relaxed/simple;
	bh=hFlYZinIE2pmIEnxdcpdsYjnVx080PnBbqYVzYeqyzs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OD2DPbSivVq+SWarKhl2rVOAB7SP62BDstjnTRI/bdsB/datzE0Igs8dVceUOi5OditZQs4Yd1gDkVj5OaTRUrthsgepqnL/b/ANAQsFU9ALYE2u8uLT4/Fl80jTVt4/MlqpITMiijzHskYZyFMgm8RT4SXc9dv+ZUUM/TV37hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RZ2eVv9J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RZ2eVv9J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90E9D1F00A3A;
	Tue, 21 Jul 2026 11:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784633098;
	bh=eXObcevundgN2b+3MiW0k0Fzs19dpRQ06wK6a1vgO68=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=RZ2eVv9J5Qp39wo4ChVTRv4PkQthSDgIgHzrPk8MHmFCrufRmPxM86OAkoeRQbJBv
	 iJUQ2Rx8nKbI/X4HHdq67LVPb68wPC/72UtF8zbBkONkqzyD5wupyOUkwy99ZZ19km
	 BbOZdO/UVKlBgpan3cCO9tjwHYq5PdAsUJ4flMhN1+4gbOthieJdk5Go6V7Yd+B8U8
	 WpL4w4cOit+mLr5UbFmYBAb42mpe+7wg025FN7RI5xcQI2Zk2VXwk55P5BNIQmP9fm
	 YZOBTCAJSXYUXIP/5mT8Dt3E8ZPkeb4Lu8WXcfSbgScNRCNtFO6xpcdsBsrXBo64jF
	 lYiLtUprw8Hpw==
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Koichiro Den <den@valinux.co.jp>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260721062815.4117887-1-den@valinux.co.jp>
References: <20260721062815.4117887-1-den@valinux.co.jp>
Subject: Re: [PATCH v6 00/14] dmaengine: dw-edma: Prepare for PCI EP DMA
 (part 1/3)
Message-Id: <178463309622.96200.16223401872873220724.b4-ty@kernel.org>
Date: Tue, 21 Jul 2026 16:54:56 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 21 Jul 2026 15:28:01 +0900, Koichiro Den wrote:
> This is v6, part 1 of three series for PCI endpoint DMA.
> 
> The three series are:
> 
>   * part 1: dmaengine: dw-edma: Prepare for PCI EP DMA
>   * part 2: PCI: endpoint: Expose endpoint DMA resources
>   * part 3: PCI: endpoint: Add PCI DMA endpoint function
> 
> [...]

Applied, thanks!

[01/14] dmaengine: dw-edma: Factor out HDMA interrupt setup helper
        commit: 3e5933f2003e89d733b8d3a3a026ab9af411fbb5
[02/14] dmaengine: dw-edma: Add per-channel interrupt routing control
        commit: 9c317842eceece7efbaf07ac1a08c5d5e8be7ad0
[03/14] dmaengine: dw-edma: Add core quiesce operations
        commit: c9c25b2f32601409a53845b41183a29c8260f33e
[04/14] dmaengine: dw-edma: Initialize IRQ data before requesting IRQs
        commit: 647217abea849d3d45f8cb0b8ee5b78d50f26985
[05/14] dmaengine: dw-edma: Add partial channel ownership mode
        commit: b24a5e9db6863567df1a10fcd29e01467672c56e
[06/14] dmaengine: dw-edma-pcie: Track non-LL mode in DMA data
        commit: 1415d6d1f101398441da43e82a076afe1c5aebd3
[07/14] dmaengine: dw-edma-pcie: Add capability match data
        commit: f3468b998a00c1491b774af188d5f741c64a1c71
[08/14] dmaengine: dw-edma-pcie: Rename vsec_data to dma_data
        commit: 6cb89b38dcd7e2144c7af8c6c6bc9d30e84b73c9
[09/14] dmaengine: dw-edma-pcie: Add platform ops to match data
        commit: f8850e66ae8b3f2809b665375ba9a7106a4779f8
[10/14] dmaengine: dw-edma-pcie: Add register offset match flag
        commit: 9504c24325ede003d111cd004e56803969764355
[11/14] dmaengine: dw-edma-pcie: Factor out descriptor block address lookup
        commit: 6f3328acabc4b78de2545bc4b4d2c8c7a4988624
[12/14] dmaengine: dw-edma-pcie: Handle optional data blocks
        commit: 81964f539601f3dcbf1ed64979aa9b5ae0e4adf4
[13/14] dmaengine: dw-edma-pcie: Add chip flags to match data
        commit: 1d68178b3404737af2cee6c7b4395de3de6dccaa
[14/14] dmaengine: dw-edma: Program endpoint function numbers
        commit: 0613e7934ee233d726af8d8c89f251a1c4df738d

Best regards,
-- 
~Vinod


