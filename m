Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794332831;
	b=ojoci3wxxKLi6eafe1JD8V9yIpKhd61VZo7/OVj9q6EcV57hiLRzexBYUSGo9R9b3DF1
	 PEpbOjrb/m4LChPB/pdE0M2Y0Wjd9AVCGsx2D0/f0vNEqQT2faOHSX60S9S2mGRS8hA4j
	 OLD6eB8WexFwGAALMZDsn396TPp2bHenO9jReflQzxclXy2NGL/tL42fsg50v99lQDiRc
	 MMqK6cpqJPDP3cOiMaTifjZCP+kteNF5jyICYUF4Ud1lEv94ZvxKD9igHoDLtthNXs4Fn
	 SVW++Zg3SydMIWeodoPtwEQJfeltG/wXSswiSlIGZu4K8kmR/4vMlinqbnADSeAXaEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794332831;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=GAGZwdCIJ6oI01UrruZjJsCbx0Rq3e3ya8oMNd1r2UU=;
	b=Isph36z5aXML1uxHUxgOM63990AzTs5q0JerC0jIwHpydnqlNdcOk5KSizCNvLAmZCY0
	 bfTeO/GY2Ofd32ZD8tkqHZoK5wAysuANf4tbBmyeUnpdj8Q1m5L1bnLNruhdRn9eqTRIA
	 bv3U5I1MfebU3eZ0MdmtjxeX/cMmaBhubctDPoaxoIK05AUBAhq9dgyPDMyxjgpy+tx8y
	 3eK4D1JO1oKI9vD0q7jR07JYpW/DQipZiUb330Qe3X+l0kSGRq251DAqPZEiTuLLDFpMw
	 LbC2ZObU8gOp2NDOM8E/ibJACZclrx483od8IPC2Wq6MnJPS9xN+bdil5zHSEL1EbjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sqt4Yzga;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6A8606A31C
	for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 17:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sqt4Yzga
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFB851F008A7;
	Tue, 10 Nov 2026 17:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794332831;
	bh=GAGZwdCIJ6oI01UrruZjJsCbx0Rq3e3ya8oMNd1r2UU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Sqt4YzgapDpPI3mYrDUIhVM2T2mWaRO5wfeCictMioJni5qLevTVT0MyLJWoZARpR
	 TjiNUsrZJv4om8oz6mR/0zk9jBJglJYGRyRkx2cxOKmeKreBvbmWqOyR1MR2itp+jU
	 wy6fRnUQpTWsWtWwgyzzz2ZpO2y3i5OWAwG5Z8yJbUZiiFeJuBWXCxQpvyelmU9DrA
	 D7mcDO1GZGbS4qrSS1sA8FXuLHp8Bwy7WzCcst+XaAruRdKm9X8+sy0DyWF+uiMZXb
	 65F/IBDqnnmjWMf47fxWSlIB0CcrKOwJ+LR/mYGnJ+queOlEdZBccFEIlv1w/lWbSO
	 i1rNUkZKEdjkw==
Message-ID: <sashiko-outbox-207513@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/4] dmaengine: switchtec-dma: add pmon sysfs
 attributes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Logan Gunthorpe" <logang@deltatee.com>, dmaengine@vger.kernel.org
Cc: vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261110173137.623764-5-logang@deltatee.com>
References: <20261110173137.623764-1-logang@deltatee.com>
 <20261110173137.623764-5-logang@deltatee.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 17:47:10 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] dmaengine: switchtec-dma: multi-line menu output in
  latency_selector_show()
--

commit a610541f39faa290edb39d9134f3a2df55bdae1a
Author: Logan Gunthorpe <logang@deltatee.com>

dmaengine: switchtec-dma: add pmon sysfs attributes

This commit adds a "switchtec-pmon" sysfs attribute group to expose
Switchtec DMA performance monitoring registers per channel.

> diff --git a/drivers/dma/switchtec_dma.c b/drivers/dma/switchtec_dma.c
> index 1ebe17095c61a..774b418330ed7 100644
> --- a/drivers/dma/switchtec_dma.c
> +++ b/drivers/dma/switchtec_dma.c

[ ... ]

> @@ -1215,8 +1222,274 @@ static const struct attribute_group switchtec_con=
fig_group =3D {
>  	.attrs =3D switchtec_config_attrs,
>  };
> =20

[ ... ]

> +static ssize_t latency_selector_show(struct device *dev,
> +				     struct device_attribute *attr, char *page)
> +{
> +	struct switchtec_dma_chan *swdma_chan;
> +	struct chan_fw_regs __iomem *chan_fw;
> +	u32 lat =3D 0;
> +	int len;
> +
> +	CLASS(dmaengine_chan_from_dev, c)(dev);
> +
> +	if (!c)
> +		return -ENODEV;
> +
> +	swdma_chan =3D container_of(c, struct switchtec_dma_chan, dma_chan);
> +	chan_fw =3D swdma_chan->mmio_chan_fw;
> +
> +	rcu_read_lock();
> +	if (!rcu_dereference(swdma_chan->swdma_dev->pdev)) {
> +		rcu_read_unlock();
> +		return -ENODEV;
> +	}
> +
> +	lat =3D readl(&chan_fw->perf_latency_selector);
> +	rcu_read_unlock();
> +
> +	len =3D sysfs_emit(page,
> +			 "To select a latency type, write the type number\n");
> +	len +=3D sysfs_emit_at(page, len, "(1 ~ 5) to latency_selector\n\n");
> +
> +	len +=3D sysfs_emit_at(page, len, "Latency Types:\n");
> +	len +=3D sysfs_emit_at(page, len, "(1) SE Fetch latency");
> +	if (lat & SWITCHTEC_LAT_SE_FETCH)
> +		len +=3D sysfs_emit_at(page, len, " (*)\n");
> +	else
> +		len +=3D sysfs_emit_at(page, len, "\n");
> +
> +	len +=3D sysfs_emit_at(page, len, "(2) VDM latency");
> +	if (lat & SWITCHTEC_LAT_VDM)
> +		len +=3D sysfs_emit_at(page, len, " (*)\n");
> +	else
> +		len +=3D sysfs_emit_at(page, len, "\n");
> +
> +	len +=3D sysfs_emit_at(page, len, "(3) Read Immediate latency");
> +	if (lat & SWITCHTEC_LAT_RD_IMM)
> +		len +=3D sysfs_emit_at(page, len, " (*)\n");
> +	else
> +		len +=3D sysfs_emit_at(page, len, "\n");
> +
> +	len +=3D sysfs_emit_at(page, len, "(4) SE Processing latency");
> +	if (lat & SWITCHTEC_LAT_SE_PROCESS)
> +		len +=3D sysfs_emit_at(page, len, " (*)\n");
> +	else
> +		len +=3D sysfs_emit_at(page, len, "\n");
> +
> +	len +=3D sysfs_emit_at(page, len, "(5) FW NP TLP latency");
> +	if (lat & SWITCHTEC_LAT_FW_NP)
> +		len +=3D sysfs_emit_at(page, len, " (*)\n");
> +	else
> +		len +=3D sysfs_emit_at(page, len, "\n");
> +
> +	return len;
> +}

[Severity: Low]
Does latency_selector_show() violate the sysfs one-value-per-file rule?

Reading latency_selector emits multi-line usage instructions and a
numbered menu marked with "(*)", while latency_selector_store() expects a
single integer from 1 to 5 via kstrtoint(), so the output cannot be
parsed as a single value or written back to the attribute.  Could
latency_selector expose a single value (or a single-line space-separated
list of tokens with brackets around the active selection, documented
under Documentation/ABI/), or move human-oriented menus to debugfs?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110173137.6237=
64-1-logang@deltatee.com?part=3D4
