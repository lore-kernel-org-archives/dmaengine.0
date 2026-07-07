Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E09B22541C
	for <dmaengine@vger.kernel.org>; Tue,  7 Jul 2026 16:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783443255; cv=none; b=RH8DVI9aAX4tr4mB2Lbr2HdeRVKvxb0PNPfPnLLQOj6gSYy9S3Mp8vYASXL6On2CKdoBhFJlmWl9k5fNvNwNmcYyIdyuXI/7mbUhKOSlrVxVnpNAMsWNo9c4k8CxD/l1LAeqEIPzDARxOQZg4cOtmMML7jgDdYato/sTsRB15Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783443255; c=relaxed/simple;
	bh=A5kbIdDH5R3psutHtpYOEfcsHfp+qY2wfiSAWQEnj5o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D31QqqecRsvWO7Y2Qte6l7LM0memAZ4tZrDXSN8gAC9a8UCbFhazPEbmMOnskRStjSohXydt2i3oGHd9x7jbRrd4ir7gH/taTL8iBYjuo+1LAIyfTIPoD4OpxyUiRwLCvUjdALF1pC2Yigd4zVh30QGAiU5IVZf3fBYX8wcTJI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XqbiAsy7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XqbiAsy7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3F031F00A3A;
	Tue,  7 Jul 2026 16:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783443254;
	bh=G0u7D3QeKJEa5kw3L7l9JgqyoZUNkP3dJyl/8xdZg9w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XqbiAsy7ujfjW0fRte7I061dwQnYz3vczoCNukmZ1eYlGFIJ+elgkvHb6bcZ9m8ss
	 vOTw6ZY3ATfPTN6rtj9UorqtQ3xfrj1q0qcRNWjCDaNSM0JVUCWCh5rOI3lvCFaXBy
	 F4GCXgz5vejrE/6hM0o3yGPZ3DkLgRbfkJxLE6ARH/SceyWoAkmxkM9b8TOOLTMOis
	 rAbdtkLlI6UpSKGAO1SzLlSuK7MrAtiiplI9AN5TcBijWM5ny8r9eghYR3YCDbDY/y
	 Xu4NcyYy45qEjHsBw4yJcdHP7MC9shSvr/yHqG0sAwf5wVS77DoejaGS86xQ8P0fDo
	 Lwxkudkc9jOxQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/5] dmaengine: add support for custom per-channel
 sysfs attributes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Logan Gunthorpe" <logang@deltatee.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260707162045.23910-2-logang@deltatee.com>
References: <20260707162045.23910-1-logang@deltatee.com>
 <20260707162045.23910-2-logang@deltatee.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 16:54:13 +0000
Message-Id: <20260707165413.F3F031F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Embedding a raw `kobject` into `struct dma_chan` without governing=
 the channel's lifecycle creates an unavoidable Use-After-Free vulnerabilit=
y due to a strict kobject lifecycle mismatch.
- [High] The `name` parameter is passed directly as the `fmt` string to `ko=
bject_init_and_add`, leading to a format string vulnerability.
- [Medium] `dma_chan_kobject_add` calculates an invalid parent pointer if c=
alled before the channel is fully registered.
- [Low] Typographical errors in the kobject initialization failure warning =
message.
--

--- Patch [1]: [PATCH v1 1/5] dmaengine: add support for custom per-channel=
 sysfs attributes ---
commit e1443713f7d441022da01ca370f8ab1129a41d63
Author: Logan Gunthorpe <logang@deltatee.com>

dmaengine: add support for custom per-channel sysfs attributes

This commit adds specific support for adding sysfs attributes to DMA channe=
ls.
It is intended to be used to replace similar functionality in ioat so it can
be utilized in other drivers.

> diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
> index 9049171df8578..7ea2a8709c078 100644
> --- a/drivers/dma/dmaengine.c
> +++ b/drivers/dma/dmaengine.c
[ ... ]
> @@ -125,6 +125,63 @@ static int dmaengine_summary_show(struct seq_file *s=
, void *data)
[ ... ]
> +void dma_chan_kobject_add(struct dma_device *dev, const struct kobj_type=
 *type,
> +			  const char *name)
> +{
> +	struct dma_chan *chan;
> +	int err;
> +
> +	list_for_each_entry(chan, &dev->channels, device_node) {
> +		chan->kobj_used =3D true;
> +		err =3D kobject_init_and_add(&chan->kobj, type,
> +					   &chan->dev->device.kobj, name);

[Severity: High]
Could this introduce a format string vulnerability? kobject_init_and_add()
takes a format string as its fourth argument, and passing 'name' directly
means any format specifiers in the driver-provided name could cause
unpredictable behavior. Should this be passed safely as "%s", name?

[Severity: Medium]
Will this calculate an invalid parent pointer if a driver calls this functi=
on
before the channel is fully registered?=20

Since chan->dev is dynamically allocated during dma_async_device_register()=
,=20
wouldn't this perform pointer arithmetic on a NULL pointer if called during=
 a=20
driver's probe routine prior to registration?

> +		if (err) {
> +			dev_warn(dev->dev,
> +				 "sysis init error(%d), continuinng...\n", err);

[Severity: Low]
This isn't a bug, but there are typos in the warning message ("sysis" inste=
ad
of "sysfs" and "continuinng" instead of "continuing").

> +			kobject_put(&chan->kobj);
> +			chan->kobj_used =3D false;

[Severity: High]
Does this error handling path introduce a use-after-free?=20

The kobject lifecycle API mandates that the release callback must free the=
=20
structure containing the kobject. If the driver complies and frees 'chan'=20
during kobject_put(), won't setting chan->kobj_used and the subsequent list=
=20
iteration dereference freed memory?

> +		}
> +	}
> +}
> +EXPORT_SYMBOL_GPL(dma_chan_kobject_add);
[ ... ]
> @@ -1143,6 +1200,11 @@ static void __dma_async_device_channel_unregister(=
struct dma_device *device,
>  	if (chan->local =3D=3D NULL)
>  		return;
> =20
> +	if (chan->kobj_used) {
> +		kobject_del(&chan->kobj);
> +		kobject_put(&chan->kobj);

[Severity: High]
If a driver does not free 'chan' in the kobject release callback to avoid t=
he
error path use-after-free in dma_chan_kobject_add(), does this create a=20
different use-after-free here?

If userspace holds an open file descriptor to the sysfs attributes, the
kobject reference count remains above zero after kobject_put(). The driver
will proceed to free the dma_chan memory during unloading, leaving sysfs wi=
th
a reference to freed memory.

> +	}
> +
>  	WARN_ONCE(!device->device_release && chan->client_count,
[ ... ]
> diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
> index b3d251c9734e9..852943ef46b8e 100644
> --- a/include/linux/dmaengine.h
> +++ b/include/linux/dmaengine.h
[ ... ]
> @@ -358,6 +358,9 @@ struct dma_chan {
>  	struct dma_router *router;
>  	void *route_data;
> =20
> +	bool kobj_used;
> +	struct kobject kobj;

[Severity: High]
Does embedding a raw kobject without governing the channel's lifecycle crea=
te
an unavoidable use-after-free vulnerability?=20

This structural approach forces a mismatch between the kobject lifecycle an=
d=20
the dma_chan lifecycle, triggering one of the two use-after-free scenarios=
=20
noted above.

> +
>  	void *private;
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707162045.2391=
0-1-logang@deltatee.com?part=3D1
