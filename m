Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFBD358399;
	Mon, 10 Aug 2026 15:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786376191; cv=none; b=Ed5r5CfcxEPJMSvEDz3jepzvQFApGIX3x4fa8JZ1lzHN572bDJbLtrQWb50R2WBcPw+zipFl1uOSLaNmAc+eF0/k9yiIVvZav+6PvT5ETlr8N1KKn9OD4FbAmvTn7+R5doE7Hpr2xlf5sV+eGWC5TDZ9HscEKHDZy8+L/jkOE30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786376191; c=relaxed/simple;
	bh=ILFB4/u2sVdwjrER7sNLEb7ru10nvyn/GzohSKaaCco=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NwTw45nbwYReRVlPDw2bvs+3zDV7k8nHRHmriD83OPMmlsMb4z82sXDGL6O9yp42ChH1KCEZfpIVRHs7EQtiSfTRQ+Nov3111V4ampxP8TQVzkh261b4Ij8MRRoZCDZFYGOgd2HplNE+E8hXEvIClEOcqXkcyf/A/cWnYmFRqbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jb6qTlEI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jb6qTlEI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD85A1F000E9;
	Mon, 10 Aug 2026 15:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786376189;
	bh=LGFGii2vnLYhDpEoYl6XTr2pwivNBxmxwsVjry/k6YU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jb6qTlEI+30P/GRsWRb+smu8Cn6zLes2yH/0bAyStX0KN8efCXLk2DhREwhc4qf21
	 wr0Xrh/JERsCIpKJl+JL0HrDQtGd7bzydbDqaTTOQ/IIPgtV4RD+sPEF0cGqoS5DL5
	 WsfMUqnbuxFkH6eNZi588qB4xmU9GGD/vDaSOOfvu82csTwu+3s95hrwtiIfPb51Up
	 PuAjk2D9uz4D566rNRmQyrYTTLa1nkjGn+N1tQaQ5D3I5qNRPEXU9g6MUjw1LDkRm7
	 3l3nAL8YUKUjJ9d7l0knqHc8Bpc+BRd4NArSgwMmousDgv315tKyz4/61XBGpXQvTP
	 JxAqC7xOYRhgQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 01/19] dmaengine: ti: k3-udma: Fix sporadic crash on
 AM62x
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260810151423.1948224-2-s-adivi@ti.com>
References: <20260810151423.1948224-1-s-adivi@ti.com>
 <20260810151423.1948224-2-s-adivi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 15:36:27 +0000
Message-Id: <20260810153628.DD85A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver restricts MSI controller retrieval to the 'msi-parent' =
DT binding variant by directly calling `of_msi_get_domain()`, causing failu=
res on platforms using the 'msi-map' binding.
- [High] The patch claims to fix a sporadic crash by zero-initializing `rin=
g_init_data`, but this is a placebo fix because all fields of the struct ar=
e already explicitly initialized. The true memory corruption bug remains un=
addressed.
- [High] Incorrect use of `INIT_DELAYED_WORK_ONSTACK` for a dynamically all=
ocated work structure causes debug object memory leaks and overwrite warnin=
gs.
- [High] DMA mappings created in `udma_setup_rx_flush` are permanently leak=
ed on probe failure.
- [High] Background work `ud->purge_work` is not canceled on probe failure,=
 risking Use-After-Free.
--

--- Patch [1]: [PATCH v8 01/19] dmaengine: ti: k3-udma: Fix sporadic crash =
on AM62x ---
commit b87c41f67fa8026f26760de8230ab1ebfd627cb1
Author: Vignesh Raghavendra <vigneshr@ti.com>

    dmaengine: ti: k3-udma: Fix sporadic crash on AM62x
   =20
    ring_init_data is declared on stack and thus can contain garbage which
    can lead to k3_ringacc_dmarings use junk address for ringrt base leading
    to below crash during ring pop

[Severity: High]
This is a pre-existing issue, but does this commit message accurately
describe the root cause of the crash?

Looking at the code, all fields of k3_ringacc_init_data (tisci,
tisci_dev_id, and num_rings) are unconditionally assigned before
k3_ringacc_dmarings_init() is called. Furthermore, k3_ringacc_dmarings_init=
()
does not read 'ringrt base' from this struct, but fetches it via
devm_platform_ioremap_resource_byname().

Could initializing this struct with { 0 } be acting as a placebo that masks
a true memory corruption or stack buffer overflow by altering the compiler's
stack layout?

[ ... ]
> diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
> index fb21e0df5ab7b..48f4db777d924 100644
> --- a/drivers/dma/ti/k3-udma.c
> +++ b/drivers/dma/ti/k3-udma.c
> @@ -5484,7 +5484,7 @@ static int udma_probe(struct platform_device *pdev)
>  	if (ud->match_data->type =3D=3D DMA_TYPE_UDMA) {
>  		ud->ringacc =3D of_k3_ringacc_get_by_phandle(dev->of_node, "ti,ringacc=
");
>  	} else {
> -		struct k3_ringacc_init_data ring_init_data;
> +		struct k3_ringacc_init_data ring_init_data =3D { 0 };
> =20
>  		ring_init_data.tisci =3D ud->tisci_rm.tisci;
>  		ring_init_data.tisci_dev_id =3D ud->tisci_rm.tisci_dev_id;

[Severity: High]
This is a pre-existing issue, but are we leaving a true root cause unaddres=
sed
here since the struct is completely initialized immediately after this line?


[Severity: High]
This is a pre-existing issue, but does this code properly handle platforms
using the 'msi-map' DT binding variant?

drivers/dma/ti/k3-udma.c:udma_probe() {
    ...
    dev->msi.domain =3D of_msi_get_domain(dev, dev->of_node, DOMAIN_BUS_TI_=
SCI_INTA_MSI);
    ...
}

Calling of_msi_get_domain() directly only iterates 'msi-parent' phandles.
Could this cause MSI allocation failures on platforms that map device IDs
using 'msi-map'?


[Severity: High]
This is a pre-existing issue, but is it safe to use INIT_DELAYED_WORK_ONSTA=
CK()
for a work structure that is part of a dynamically allocated object?

drivers/dma/ti/k3-udma.c:bcdma_alloc_chan_resources() {
    ...
    INIT_DELAYED_WORK_ONSTACK(&uc->tx_drain.work, udma_check_tx_completion);
    ...
}

The INIT_DELAYED_WORK_ONSTACK() macro is intended for stack variables and
requires a matching destroy_delayed_work_on_stack(). Since uc is heap-alloc=
ated
and destroy_delayed_work_on_stack() is never called, could this lead to deb=
ug
object memory leaks and ODEBUG overwrite warnings?

This same pattern also appears in pktdma_alloc_chan_resources().


[Severity: High]
This is a pre-existing issue, but are the DMA mappings created in
udma_setup_rx_flush() properly unmapped on probe failure paths?

drivers/dma/ti/k3-udma.c:udma_setup_rx_flush() {
    ...
    rx_flush->buffer_paddr =3D dma_map_single(dev, rx_flush->buffer_vaddr,
                                            rx_flush->buffer_size,
                                            DMA_TO_DEVICE);
    ...
}

If an error occurs later in udma_setup_rx_flush(), or if udma_probe()
subsequently fails and returns an error:

drivers/dma/ti/k3-udma.c:udma_probe() {
    ...
    return ret;
}

These DMA mappings appear to permanently leak, as they are not managed by
devres and are not unmapped before returning.


[Severity: High]
This is a pre-existing issue, but is there a risk of a use-after-free if
the device is unregistered on probe failure?

drivers/dma/ti/k3-udma.c:udma_probe() {
    ...
    dma_async_device_unregister(&ud->ddev);
    ...
}

If of_dma_controller_register() fails after dma_async_device_register(),
the DMA channels are briefly exposed. If a client requests a channel and
schedules ud->purge_work before the device is unregistered, could the
asynchronous work execute on the devres-managed ud structure after it has
been freed, since cancel_work_sync(&ud->purge_work) is not called?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810151423.1948=
224-1-s-adivi@ti.com?part=3D1
