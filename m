Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D46339369
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786386696; cv=none; b=IV9qhTtikl+s/150PDAoenYsmV7LB8SWfFJqXeRz0IC8k9Mjb+AIAb4sbGEcgNp0yq+cAMklDDIW492olEjquVv+husm5L2PMNjVjlOtZnYt3w5sRPRS8I1Vxoz76592v3gihq3zr1J83Ac2fo8W1/PEFflTrVLF6Wio9MmepZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786386696; c=relaxed/simple;
	bh=OuvMpRK9hrsp55JnweQ/eeHHqWv8kc5efxtErU97vTM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lwEdN9ZWV+tV18QgzkqTBteHO/kk6x8yaZdjnVxmhSpAh1HZTVZjsdyctbuBoJXtPCLUE+UCvlrmvva3pp63n48JTjHPoR3ifqEJxxDcRPxFJUx7bdqD5KipIDCIZoRZC199fjGVEi3Wumv56UKqvoVLGIexfpVONKfy4JC9vHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n5fo/c7A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n5fo/c7A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFB671F000E9;
	Mon, 10 Aug 2026 18:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786386695;
	bh=TjB918mq6UxhduMPlxrYVvMGWvSeMQTscPnDjHzAjDs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n5fo/c7Aa4zFX+NA5Xknj2xwtE6eSepzwKC7+R478xeyvz1dZKDhh+z3LNa3ImmGp
	 phZalxwXHpwUZ2ImPd5W90cQrGIYqUSUn7UDwQCmdc0FdJ744V1pse4/RClDqnzIbQ
	 3pbXmRpbAbI3dmcWLJX/NUdBZeOywZu3Ar9DgUzMh1tSN6nndooOu9m3qMaECpJ+32
	 tsdz7d1hd2Rw0tVBGDUa+GC0/GhLnVqccidv8H8lUgl9J0dbmey1HgSi1+f9XWEu8g
	 sEIZmx1bjp6P+xmpAgH04xDD/FyHx1PtNV/CyjicQzHQ3G1a139mwANwLJSgRkEAi+
	 YezISHxVzmNXA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 20/34] dmaengine: xilinx-dpdma: kill vchan BH on
 remove
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <7185ee59e7bc0451f9ebb19178d3f76edee65658.1786384169.git.allen.lkml@gmail.com>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <7185ee59e7bc0451f9ebb19178d3f76edee65658.1786384169.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 18:31:34 +0000
Message-Id: <20260810183134.CFB671F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The device AXI clock is disabled before tasklets and BHs are expli=
citly killed in the remove path. This allows pending tasklets or BH work to=
 execute and access hardware registers while the clock is off, causing fata=
l AXI bus errors.
--

--- Patch [20]: [PATCH v3 20/34] dmaengine: xilinx-dpdma: kill vchan BH on =
remove ---
commit cd30e3f8d0e3620da3deb8ffdbd41901ce171ab7
Author: Allen Pais <allen.lkml@gmail.com>
dmaengine: xilinx-dpdma: kill vchan BH on remove

This commit modifies the xilinx-dpdma driver to cancel the virt-dma
per-channel BH work when removing a channel. It adds a call to
dmaengine_kill_bh() to ensure the BH is killed before the channel is
removed, alongside the existing tasklet cleanup.

> diff --git a/drivers/dma/xilinx/xilinx_dpdma.c b/drivers/dma/xilinx/xilin=
x_dpdma.c
> index d9a3542c4531c..7e147ea11368d 100644
> --- a/drivers/dma/xilinx/xilinx_dpdma.c
> +++ b/drivers/dma/xilinx/xilinx_dpdma.c
> @@ -1685,6 +1685,7 @@ static void xilinx_dpdma_chan_remove(struct xilinx_=
dpdma_chan *chan)
>  		return;
> =20
>  	tasklet_kill(&chan->err_task);
> +	dmaengine_kill_bh(&chan->vchan.chan);

[Severity: High]
This is a pre-existing issue, but could waiting for the BH or tasklet to
finish here trigger an AXI bus fault?

In xilinx_dpdma_remove(), the AXI clock is disabled before the driver itera=
tes
over the channels to remove them:

drivers/dma/xilinx/xilinx_dpdma.c:xilinx_dpdma_remove() {
	...
	clk_disable_unprepare(xdev->axi_clk);

	for (i =3D 0; i < ARRAY_SIZE(xdev->chan); i++)
		xilinx_dpdma_chan_remove(xdev->chan[i]);
	...
}

If a tasklet like chan->err_task or a vchan BH was scheduled by the hardirq
just before the IRQ is freed, it could execute while the clock is already
disabled.

Functions like xilinx_dpdma_chan_err_task() read hardware registers via
xilinx_dpdma_chan_poll_no_ostand(). Does accessing these memory-mapped
registers without the required clock cause a system hang or panic?

Would it make sense to disable the AXI clock only after all channels have
been removed and their tasklets and BHs killed?

>  	list_del(&chan->vchan.chan.device_node);
>  }
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786384168.gi=
t.allen.lkml@gmail.com?part=3D20
