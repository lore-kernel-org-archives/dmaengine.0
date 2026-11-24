Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795535944;
	b=pccg8mScaBntwGXLJ2m2/6uJlAbgUZL4S1h69oSswaQwDZYSY22ELBiLMYKtlXPZkNKA
	 8iOHoZePEElbdTQtcz79DSnScG0g1/04DJtx6xcm5i+t8LG9/MNYyQkWFuPAMbErLTNzP
	 if75DafQYJDWclqjjl+7tNNUq6Khzik/JUj6x6rODjWY559fKs9OnrPSr/cr6Im+AlHEj
	 5ZRrH9Gl/R2CxfT9yFRRP+p16L/p9+Mj9ajGqOcHFeRbf6EHvGrYqDBWEgrsIPSxyAi8i
	 f07S+YmVQY5kEAOdYy2VR+5jux6HdOsNydQMaGhAzvgARY7FG8ntQk7dGx2CyeSMQkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795535944;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=lQbANhp0f+vsoSCRjd1z882ryfSAT0kzx6CZO8+Ld4U=;
	b=3h37sB5h4Oq1ZPwKiBPUW7YZGzvRk6/2hxpHtujfTCWsYTWC/cA4BKgceEY6gtPBdkUD
	 /xaLIw1ctQbnlNb6Ly2DHGxgwrimYtkYYefqvcc9sol6sMBy0UYlDkjtI4IBlpbxtAIbo
	 f1J9Ny4ArqZJw3LWdswXwWQ5Z1W4xLSvT2Mdgt68SVhc4AlstyE/gwAp+XGUQ5wLmyN5U
	 kjGQSMnbqbGZvJ79Oi5mFygNO12iAqvSdfkquxXIr9gjt/5njn7X+1Gj5gLBrEqhE696/
	 eM5wj5dhQcp8YHCkEF8IK24hsm53P5mIE1Ir1UFBDAkuWIqvkE/bm2KTkmx6cHWiq1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aY4l3yjZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD14606A31E
	for <dmaengine@vger.kernel.org>; Tue, 24 Nov 2026 15:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aY4l3yjZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AB661F000CF;
	Tue, 24 Nov 2026 15:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795535943;
	bh=lQbANhp0f+vsoSCRjd1z882ryfSAT0kzx6CZO8+Ld4U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aY4l3yjZMKMB+vIIFqe/CMshnZJLRib95WbuNm3Qtq7UMtw+Yyof03l8gTXLPhJQ1
	 ObYzpYOJM6zp1wqvylYuqq75DeLfoAvV8fAQkjEfIyGrNKIX49esPoAM4CPbC4Awfo
	 f/V9Q+IrpSvHJnR1URKowecp0sPrYBEsKkNLrtcDuXci+4tOd7+5rEQLiXJ1EzNQRu
	 buDsclgnj/csG4aVb/gzo13dS2uA/RBYminzKso5zdBoHSifdEeUiBnLGTlx+s0JKj
	 pyn7NN53SB5CjVv5qP45S4+OgxjKcb0xktGGLy6WcZbj4zXwnquxfm/0Piyp5S3Eu2
	 w/g4QdFXSCTIg==
Message-ID: <sashiko-outbox-231501@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/4] dmaengine: switchtec-dma: add pmon sysfs
 attributes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Logan Gunthorpe" <logang@deltatee.com>, dmaengine@vger.kernel.org
Cc: vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261124155024.920403-5-logang@deltatee.com>
References: <20261124155024.920403-1-logang@deltatee.com>
 <20261124155024.920403-5-logang@deltatee.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 15:59:03 +0000
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

commit 88f647b9334dbbed040eb8ea50d2882f9874a0c9
Author: Logan Gunthorpe <logang@deltatee.com>

dmaengine: switchtec-dma: add pmon sysfs attributes

This commit adds a "switchtec-pmon" sysfs attribute group to expose
Switchtec DMA performance monitor registers per channel.

> diff --git a/drivers/dma/switchtec_dma.c b/drivers/dma/switchtec_dma.c
> index 1ebe17095c61a..774b418330ed7 100644
> --- a/drivers/dma/switchtec_dma.c
> +++ b/drivers/dma/switchtec_dma.c
[ ... ]
> @@ -1215,8 +1222,274 @@ static const struct attribute_group switchtec_con=
fig_group =3D {
>  	.attrs =3D switchtec_config_attrs,
>  };
[ ... ]
> +static ssize_t latency_selector_show(struct device *dev,
> +				     struct device_attribute *attr, char *page)
> +{
[ ... ]
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
> +
> +static ssize_t latency_selector_store(struct device *dev,
> +				      struct device_attribute *attr,
> +				      const char *page, size_t count)
> +{
[ ... ]
> +	if (kstrtoint(page, 0, &lat_type) < 0)
> +		return -EINVAL;

[Severity: Low]
Does latency_selector_show() violate the sysfs one-value-per-file rule in
Documentation/filesystems/sysfs.rst?

Reading latency_selector emits multi-line usage instructions and a
numbered menu marking the active bit with "(*)", whereas
latency_selector_store() parses a single integer from 1 to 5 via
kstrtoint(), so the attribute's output cannot be parsed as a single value
or written back to the file.  Could latency_selector expose a single value
(or a single-line space-separated list of tokens with brackets around the
active selection, documented under Documentation/ABI/), or move the
human-formatted menu to debugfs?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124155024.9204=
03-1-logang@deltatee.com?part=3D4
