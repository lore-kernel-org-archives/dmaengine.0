Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794365031;
	b=qajEgs/mjm/qj55KiPnFv9s4WtAn5DzV8ktyQgS2HduwYKl9T23+GCapY7TtBq2dpZV6
	 kOSwDcfEFGzXv1nc7IKVWIMaZaDcJWosI2Zx1vxFYzAL/Fb0iKgZfJE0D7mfXPSCrksT0
	 OknwqC2gV+rIevctewPjbLqeLjneexXAwgqF+12SXYLeq+mTeMBAU7HVb0K02sF7T/cP6
	 aUEt9LKD28aVpMdOQrnMHkn++0hGu6GQGx4Qy69ipUMJcMcE9y0c/y2IT2nurbiv1Ss2v
	 qm44qtxfrR7Z1/ikFJxh0kXQBG+cmjfzHML8As1G85t8FIyKxXpmsGx8xynSrwvcUEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794365031;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=NuEFLaT52k1mcC1CCflGviNRr8N21PUZRjpF7gg18Qw=;
	b=TfZnWKvRjlyVERDSnRAwL57ZQAImAp6VXyqgyoS92Abp7RDYlv+dBNQJzLUUUMFe4IKY
	 kswJhtRF4pOtlBmcm7j/75s/VdSxrAeIsLn1zObalD4KyzwFLvSQnmFWY9mvwaBIOO4UI
	 g7Hf6XwpKwMNvV6mzCjQ1C7+qHNm2w/HvRKDvsRjwmGsPvw+XCPadlc8CBOnduv2tJXYC
	 lJH7cp0LsSeGiqetaycKzKAseVZDm/rgY4GZivsE8IgHsXNZV1sVbXuGSw7vWUfE0zMFo
	 238CREW/uRa5y05gJnv7DY+oLo9jyqW8mexzptFE0Qrch8SHt2fuETfFgpnvx0hhAVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gMbvs5eE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD323606A320
	for <dmaengine@vger.kernel.org>; Wed, 11 Nov 2026 02:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gMbvs5eE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48FF41F0093C;
	Wed, 11 Nov 2026 02:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794365031;
	bh=NuEFLaT52k1mcC1CCflGviNRr8N21PUZRjpF7gg18Qw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gMbvs5eEI9aw+7gF0JANidHaHq3R4mGrXER4ZpI8OFgNrrx6RdvETA0YMl51lIbGN
	 BGQ+3EEaP+B9JV1U4O3695F7d2UwTccL7gkQAA+2LbUxVrGljkCj7oLjA6KI+vfax1
	 NpXwOWfNP5jMLVdBsg2dQiByjb9raJewEoOL0y8vTpehe/TfoO0u8Zj27uXOaP7sxm
	 ocO0QrSAfBrR1Ay5DdspwGQq19JKtk/Ne89oRfJB0ZHuFxdZV+I/0Qw15U2/l27PfA
	 W88ujTCSX2tWFOjFhv+8FRK4xDE2fz47ezrTMwZrL7iCNHOhzhYM/CTSfXh4WqJEo8
	 Vko5FnbBaBGAQ==
Message-ID: <sashiko-outbox-208111@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: idxd: Avoid destroying the device workqueue
 twice
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yao Kai" <yaokai34@huawei.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261111021026.3354620-1-yaokai34@huawei.com>
References: <20261111021026.3354620-1-yaokai34@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 02:43:50 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [Critical] dmaengine: idxd: use-after-free and double free in
  idxd_alloc() [1]
--

commit 8d423d27ba8372d572adfd4d4096b791e0e07bdf
Author: Yao Kai <yaokai34@huawei.com>

dmaengine: idxd: Avoid destroying the device workqueue twice

This commit clears idxd->wq after destroying the workqueue on error paths
and guards destroy_workqueue() in idxd_conf_device_release() with a NULL
check so that the workqueue is not destroyed twice.

> diff --git a/drivers/dma/idxd/sysfs.c b/drivers/dma/idxd/sysfs.c
> index 6d251095c350f..d5ffc641c8567 100644
> --- a/drivers/dma/idxd/sysfs.c
> +++ b/drivers/dma/idxd/sysfs.c
> @@ -1836,7 +1836,8 @@ static void idxd_conf_device_release(struct device =
*dev)
>  {
>  	struct idxd_device *idxd =3D confdev_to_idxd(dev);
> =20
> -	destroy_workqueue(idxd->wq);
> +	if (idxd->wq)
> +		destroy_workqueue(idxd->wq);
>  	kfree(idxd->groups);
>  	bitmap_free(idxd->wq_enable_map);
>  	kfree(idxd->wqs);

[Severity: Critical]
This problem wasn't introduced by this patch, but can the err_name path in
idxd_alloc() cause a use-after-free and double free [1] of idxd,
idxd->opcap_bmap, and idxd->id?

drivers/dma/idxd/init.c:idxd_alloc() {
    ...
	device_initialize(conf_dev);
	conf_dev->parent =3D dev;
	conf_dev->bus =3D &dsa_bus_type;
	conf_dev->type =3D idxd->data->dev_type;
	rc =3D dev_set_name(conf_dev, "%s%d", idxd->data->name_prefix, idxd->id);
	if (rc < 0)
		goto err_name;
    ...
 err_name:
	put_device(conf_dev);
	bitmap_free(idxd->opcap_bmap);
 err_opcap:
	ida_free(&idxd_ida, idxd->id);
 err_ida:
	kfree(idxd);
    ...
}

When dev_set_name() fails, conf_dev->type is already set, so
put_device(conf_dev) invokes idxd_conf_device_release(), which frees
idxd->id, idxd->opcap_bmap, and idxd.  The fallthrough to err_opcap and
err_ida then reads from the freed idxd struct and frees all three a second
time.

[1] https://sashiko.dev/#/bug/linux-4811d59b-3028-4d67-8ce7-e0e9de64774f

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111021026.3354=
620-1-yaokai34@huawei.com?part=3D1
