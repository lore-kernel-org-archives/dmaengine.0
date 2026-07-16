Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3D713AA2D
	for <dmaengine@vger.kernel.org>; Thu, 16 Jul 2026 05:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784180238; cv=none; b=jSWkr3fhrBANGwKqBS+18RP/rsxemQebTVgTACN+fbs7Py+DWgG+sjy/tMJX2/Ud22ymKAwD6i+RFyZ28OEMFFBdYughrQHRE2V/7kyJ7JdR1HOey10RdbrHwPomtmJ3E9jkKWxnNLWhHC8oG5O8vZ5qTpZbTDfdPUHa53cBOno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784180238; c=relaxed/simple;
	bh=H5XZiuIy8tdmcHOy9SxXW3aCIvkaEpqFBk9+Jq5UWu8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jUn6ScCTxuOrJv+LiKtNXlf82UM1c04NkUjvFf5/wcCNc0zSsMJSAa3FhoeE+OYIf9Lr4AR9X8nbZRqAfNlmhmmfN/F64ga08wyWi2rjSyKuVaKMi5iuiDAD52VSpYmP9qxzA8U6iteJCIlFLuVsZBF/mEZI1ADOPvAtgtCcYjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gOZzqGHi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gOZzqGHi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B3F31F000E9;
	Thu, 16 Jul 2026 05:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784180237;
	bh=9IaVx07vaX0zRa0DcFo7zZtObRBWdl3pNWVGYI6N+i4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gOZzqGHi5zzz1sljQXo5tagwVPoDC7IHs9LbTpcrBbzQGuDUg+K1N+UCEnH9G1crW
	 ya8wRPamRnle8sZU5+IDK7dAb0oM79U7tXaXsH22cGf4DQQFdZvxX2iCggkk/44o5v
	 1sEtO7mPCMQyqPJ2faKvSyabm0hogAOMS7gt1iZomDfNKpvLyv1/a5IiEiVeT32CzH
	 EniwylaKdDgRyY+N2RVPKHEVCzuWdeCFysz0wk1hmD1Fs8EWRN/vciKQzCBWKMUgTD
	 JQdar4E+JKmR9NxyrpgnEv9Gjo27by1UjDO0merdk+Hb78bi6rebB5sgwNOSh6nffV
	 AciwBvnnld0Ag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: validate dev and name in dma_request_chan()
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260716052758.23465-1-phucduc.bui@gmail.com>
References: <20260716052758.23465-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 05:37:16 +0000
Message-Id: <20260716053717.0B3F31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but if `kasprintf` f=
ails to allocate `chan->name`, the function returns the channel but leaves =
`chan->slave` uninitialized.
--

--- Patch [1]: [PATCH] dmaengine: validate dev and name in dma_request_chan=
() ---
commit ac1213130dc39a9098faa262ed0755d63436e5be
Author: bui duc phuc <phucduc.bui@gmail.com>

dmaengine: validate dev and name in dma_request_chan()

This commit adds a WARN_ON check for NULL dev and name pointers at the
start of dma_request_chan(). It helps catch invalid caller arguments early
instead of causing NULL pointer dereferences later during lookup.

> diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
> --- a/drivers/dma/dmaengine.c
> +++ b/drivers/dma/dmaengine.c
[ ... ]
> @@ -814,10 +814,15 @@ static const struct dma_slave_map *dma_filter_match=
(struct dma_device *device,
>  */
> struct dma_chan *dma_request_chan(struct device *dev, const char *name)
> {
[ ... ]
> found:
> #ifdef CONFIG_DEBUG_FS
> 	chan->dbg_client_name =3D kasprintf(GFP_KERNEL, "%s:%s", dev_name(dev), =
name);
> 	/* No functional issue if it fails, users are supposed to test before us=
e */
> #endif
>=20
> 	chan->name =3D kasprintf(GFP_KERNEL, "dma:%s", name);
> 	if (!chan->name)
> 		return chan;
> 	chan->slave =3D dev;

[Severity: High]
This isn't a bug introduced by this patch, but is it intended to return the
channel with an uninitialized slave pointer here?

If kasprintf fails under memory pressure, the function returns the channel
early:

dma_request_chan() {
    ...
    chan->name =3D kasprintf(GFP_KERNEL, "dma:%s", name);
    if (!chan->name)
        return chan;
    ...
}

This leaves chan->slave uninitialized. If DMA provider drivers rely on
chan->slave pointing to the client device, could this cause a NULL pointer
dereference or memory corruption when accessed later?

If returning the channel is intended upon name allocation failure, should
chan->slave be initialized first?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716052758.2346=
5-1-phucduc.bui@gmail.com?part=3D1
