Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BCA12B94
	for <dmaengine@vger.kernel.org>; Wed,  5 Aug 2026 21:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785966100; cv=none; b=pn1DkjjXxf0qdeGXqY8vXFulOfkCd66Zfsqc1r0jIQhTGnulXdNEmVEcERajColjuTY7K3spWjhngA6XuS2pYndu1JFJy01b7Bb2fm8D6M6Kc6ipogEvbjTLfPBl0j8aczkDbuFjfYb39darPZ2Nr3vtJxe31GZGsmQOamTiaJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785966100; c=relaxed/simple;
	bh=ESrIapESNowIqIcHQyyFyxoErSVYZVeZwGuIz6ZMmHc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=B0vniDsybDpNFL4vK3gMSu6dWCNRPi+Zxsql5ky7XazscT6efQpTthrQiRAYszncOlpyBfbbWdgJ5dOfrvlHbJrbYbXFs9AO1n6m7u8WVFpAmxm3fmGSfnYG5Wm6UFNKF9r4QGUUzpS/oWsHbSRHnAmUUJtKV+xKbGkxSAzcD/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S72Vv9Jg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S72Vv9Jg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D45BE1F000E9;
	Wed,  5 Aug 2026 21:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785966099;
	bh=NAJ33bhISPEh4HcJ58On3zzqAVKVgyn0OQNGrrun2uM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S72Vv9JgSGT6UCf3LrSMvY6Noa4ARbthGLptw9xwgY3IL7yxhjJaQJXT6M8D39k/s
	 tPo1PSXmZW8tAt/EZUAyehff1x+dwUVeBLSKAeArudf/X6ohL0MXp0x7PwPCh++3Oz
	 yBRy52bxR2u9IR35GwSWPSKv9MkrL3gJIjXA8MfZWP4FdvQhWaN2yP0L0fd+Yaj0jJ
	 IiUrQb0YsTkDk4rZivST4k8xC5+G9tJk5lvhtKK3ySTXbTRu3o9GPJ7KWmXM+Dbj2K
	 b4FwSlUJB6carMk9UX073eEusHudnmT0AIvMpKn/mfYgRLXkWVOwCGU9tzs72NNCna
	 WzbK1wbIXLTUA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/5] dmaengine: idxd: assign all engines to group 0
 in IAA defaults
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vinicius Costa Gomes" <vinicius.gomes@intel.com>
Cc: dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org
In-Reply-To: <20260805-iaa-crypto-fixes-zswap-v2-1-55c02694f499@intel.com>
References: <20260805-iaa-crypto-fixes-zswap-v2-0-55c02694f499@intel.com>
 <20260805-iaa-crypto-fixes-zswap-v2-1-55c02694f499@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 21:41:37 +0000
Message-Id: <20260805214138.D45BE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Blind array access to `idxd->wqs[0]` and `idxd->groups[0]` crashes=
 the kernel if the device reports 0 for max workqueues or max groups.
--

--- Patch [1]: [PATCH v2 1/5] dmaengine: idxd: assign all engines to group =
0 in IAA defaults ---
commit 209df0dc4b3ef9ed572aa6087272c2bf0872b76a
Author: Giovanni Cabiddu <giovanni.cabiddu@intel.com>
Subject: dmaengine: idxd: assign all engines to group 0 in IAA defaults

This commit updates the IAA device defaults to assign all available engines
to group 0. This change ensures that the full hardware parallelism is used
by default without requiring manual accel-config setup.

> diff --git a/drivers/dma/idxd/defaults.c b/drivers/dma/idxd/defaults.c
> index 2bbbcd02a0dac..26ebfa2ca1448 100644
> --- a/drivers/dma/idxd/defaults.c
> +++ b/drivers/dma/idxd/defaults.c
> @@ -8,6 +8,7 @@ int idxd_load_iaa_device_defaults(struct idxd_device *idx=
d)
>  	struct idxd_engine *engine;
>  	struct idxd_group *group;
>  	struct idxd_wq *wq;
> +	int i;
> =20
>  	if (!test_bit(IDXD_FLAG_CONFIGURABLE, &idxd->flags))
>  		return 0;

[Severity: High]
This is a pre-existing issue, but does idxd_load_iaa_device_defaults()
safely handle devices that report 0 workqueues or groups?

If a malfunctioning device reports 0 for max_wqs or max_groups during probe,
the setup routines will allocate 0-sized arrays. This function later access=
es
the first elements without checking the bounds:

idxd_load_iaa_device_defaults()
{
        ...
        wq =3D idxd->wqs[0];
        ...
        group =3D idxd->groups[0];
        ...
}

Would this lead to a kernel panic by dereferencing a zero-size pointer
if the device capabilities are malformed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-iaa-crypto=
-fixes-zswap-v2-0-55c02694f499@intel.com?part=3D1
