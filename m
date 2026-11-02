Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793603024;
	b=H+443om85clvo1/U5pmqS4rCWSeLNqx0kH5gSTQPUA28vDAPQkBzTdf75rCSG6tqlFGI
	 sntkxkOH/hcfJcZ2hevQLHqJpsOO28cshi5SmOYtqmZiB9O9d0AsADoUspBAT5lm4EFFp
	 oX0OChfLDzqPe4puLLtoad2gdhXWE/eiyhHZN2GHVqkwaRb6rHcUWRMDJ071cGxF1zTCE
	 kJUNdQ6dfbmAdsXFhFtv/aoX+VPisq+8MkdKIkpXAWaDQ1Tpz8XHIUSP4zq4Z9lLb5lQ+
	 sD9wThmQgS2wg+YdTMkrhCdi/mr7aNEdepLbJUCBMvns7mN60sGBnN4Y8KJALOix2aQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793603024;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=UUw0ctTi/m+7pPUs2IZI93zqx4ZkYsmsSqj8ZBy5JVg=;
	b=hb14hrQKo12Zbdfj1OolGijEzBmePa5YxDjXf/J/Mn9t5Ji3wWqSedxpvuqzulhUzYA3
	 Hpfz2nKiVAdgBM+/lStBQs7FvZ3OhGk5maVYIbtOxzNp8/S4OyRlUtnfNgDGrPDvWTDpi
	 WiBuK0QelKVCSICkudkUzr0E/2Gjjm/xidJEfUFxyJ44xVdSW+leDR497VEdSKyaNI2MZ
	 VrfIArf/XYwaMp4DYFlNkF80Ha3vISKpGZZSN3Jo/wqRq+fRGkKIpHxzQ5TDXdtAcqUpC
	 T4630JYTIxX0/mYALpiv+e33VF6ZrOlYFLs/btniiMLBr5HXas0lbkFFxZ4q6GxayNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ATK3du0D;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C266D606A324;
	Mon,  2 Nov 2026 07:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ATK3du0D
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03F861F000C1;
	Mon,  2 Nov 2026 07:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793603023;
	bh=UUw0ctTi/m+7pPUs2IZI93zqx4ZkYsmsSqj8ZBy5JVg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ATK3du0DE5rtW/BEkyQ0+NzI+D0XvBPf2fkZ35j3cxnoWamtEH22Vv3Qpn5/OjO9Z
	 mtBeoWVcPabLEYduzBPyy+4za1I/lJjJdkYKnbHaFINqZF57fUTbWr7jpxI5gMwb3S
	 mEnoucc2ujY+QS6yih+IJ/vwWiALZYtnc6eEYgIoDkvWAHam/AS8W6/hePvCmavJaN
	 dAQb1+31yLT8lUU4bcRWyddHyvV45C6EPUmyawOH4NgnTyQsC9UvRg+1rG56n155UU
	 bsdnnYNGNszsth9suoyRFvsuoqdRMBaM+1W3eEavmbZoEraFmJGQLJJWQzvnSZsIlR
	 jhlxZE7VY9izQ==
Message-ID: <sashiko-outbox-192996@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/7] iommu: register the DMA channel bus for IOMMU
 notifications
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: imx@lists.linux.dev, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261102-edma-iommu-v3-v3-3-9d0e62a954eb@Example.Com>
References: <20261102-edma-iommu-v3-v3-0-9d0e62a954eb@Example.Com>
 <20261102-edma-iommu-v3-v3-3-9d0e62a954eb@Example.Com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 07:03:42 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] iommu: iommu_device_register() fails before arch_initcall(dma_bus_=
init)
--

commit 9240bcc4b7e8d99a1e2af1ff943ce2458c2e21eb
Author: Peng Fan <peng.fan@nxp.com>

iommu: register the DMA channel bus for IOMMU notifications

This commit adds dma_chan_bus_type (guarded by CONFIG_DMA_ENGINE) to
iommu_buses[] so the IOMMU core installs its bus notifier for DMA channel
devices.

> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index b486b8bbd1fcd..6fa871bbd63ad 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c

[ ... ]

> @@ -191,6 +192,9 @@ static const struct bus_type * const iommu_buses[] =
=3D {
>  #ifdef CONFIG_ARM_AMBA
>  	&amba_bustype,
>  #endif
> +#ifdef CONFIG_DMA_ENGINE
> +	&dma_chan_bus_type,
> +#endif

[Severity: High]
Could this cause iommu_device_register() to fail when called before
arch_initcall(dma_bus_init)?

The commit message notes that dma_chan_bus_type is registered at
arch_initcall before iommu_subsys_init() runs at subsys_initcall, but
iommu_buses[] is also iterated by iommu_device_register():

drivers/iommu/iommu.c:iommu_device_register() {
	...
	for (int i =3D 0; i < ARRAY_SIZE(iommu_buses) && !err; i++)
		err =3D bus_iommu_probe(iommu_buses[i]);
	if (err)
		iommu_device_unregister(iommu);
	...
}

And bus_iommu_probe() calls bus_for_each_dev(), which returns -EINVAL if
the bus has not been registered via bus_register() yet:

drivers/base/bus.c:bus_for_each_dev() {
	struct subsys_private *sp =3D bus_to_subsys(bus);
	...
	if (!sp)
		return -EINVAL;
}

Every other bus in iommu_buses[] is registered at postcore_initcall or
earlier. On PowerPC, spapr_tce_setup_phb_iommus_initcall() registers PHB
IOMMU devices at postcore_initcall_sync, before arch_initcall(dma_bus_init):

arch/powerpc/kernel/iommu.c:spapr_tce_setup_phb_iommus_initcall() {
	struct pci_controller *hose;

	list_for_each_entry(hose, &hose_list, list_node) {
		ppc_iommu_register_device(hose);
	}
	return 0;
}
postcore_initcall_sync(spapr_tce_setup_phb_iommus_initcall);

When CONFIG_DMA_ENGINE=3Dy, wouldn't bus_iommu_probe(&dma_chan_bus_type)
return -EINVAL during spapr_tce_setup_phb_iommus_initcall(), causing
iommu_device_register() to unregister all PHB IOMMU devices?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-edma-iommu=
-v3-v3-0-9d0e62a954eb@Example.Com?part=3D3
