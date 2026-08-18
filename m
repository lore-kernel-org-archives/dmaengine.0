Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44DA3C342D
	for <dmaengine@vger.kernel.org>; Tue, 18 Aug 2026 03:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787025438; cv=none; b=UmOdjuAqFybCl5N12+B4j01obAkOPtslaSya8Gie7XBK9yburRS0tteykb/kyZ/kpA9rbU+45G6RV63QK5CtLZFfhjv3JOgmuxBJPOpGiOZNh+yXznPsgTdPYaICb2R3zi5BimNpiDnHS7sIbQj5RAb9neXhGKxq73wE9/w2MXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787025438; c=relaxed/simple;
	bh=PvILJeGmtjcbVo9rZU7drHDD9Zbl0KIuH8E288+hNI0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UYDtp362nXF2B/d0wXJNglPKVceTSZL70F7T4HibSEJ2lIxDt+/VwdlV9D2LkjIUO40O1pnAAch8cyonsDb594a9f+fM/QpM4BS+BJI/W6ZqWjb7BzQs8mxu6/D8xx/5l+7X4nDc16h9iywe9GlrJ5F8OA+g/e6APPOEDPwI+vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aTmKKNRp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aTmKKNRp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3197C1F000E9;
	Tue, 18 Aug 2026 03:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787025437;
	bh=maFTonxCmp0CTO+2YQt8o9omkRNYatiPHM32zganobY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aTmKKNRpisAo83F5RTUjm8CUgOH7Ph4V2Tf5RBpCChuRNpzplFM3hzFRKLTYL0xNO
	 NHeux0FYJadVLBJYcvnLJt8L2hLYe32oeNOBas9EHPuEpD1sAQgj8RlzP6hfNXhJQJ
	 Nht/CtfXD5HxveYqFvu9UHfW+1JWSNQlqpXdFCjLfzn8zwTQ0bvNe+AJxd4ujOnMPw
	 SrwM7/QAwa7lnhL5m6p3Q0i6AWdph4qu1KtwKcoGZbREVzKtbxK56ApIiz4fRxwraO
	 dKmUuMt0l9pmmu7TRbFQH9cKKyhGlHWgO33+km7ey/ZTBd1Lq0L4mxpT+UKWrYHHxQ
	 WdquojsbTQc6A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/4] dmaengine: fix use-after-free in dma_chan_put()
 and dma_release_channel()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shivank Garg" <shivankg@amd.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260818-dmaengine-kref-fix-v4-3-c6ef991462a0@amd.com>
References: <20260818-dmaengine-kref-fix-v4-0-c6ef991462a0@amd.com>
 <20260818-dmaengine-kref-fix-v4-3-c6ef991462a0@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 03:57:16 +0000
Message-Id: <20260818035717.3197C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Use-After-Free in dma_release_channel() due to accessing 'chan' af=
ter dropping its reference via dma_chan_put()
--

--- Patch [3]: [PATCH v4 3/4] dmaengine: fix use-after-free in dma_chan_put=
() and dma_release_channel() ---
commit 4ca601ffe76f0ae6fcc1118c90ce61d882e870d0
Author: Shivank Garg <shivankg@amd.com>

dmaengine: fix use-after-free in dma_chan_put() and dma_release_channel()

This commit addresses a use-after-free in dma_chan_put() where the channel's
device owner is accessed after the device reference is dropped. It caches t=
he
module owner before calling dma_device_put() to prevent KASAN warnings.

Link: https://sashiko.dev/#/patchset/20260518-dmaengine-kref-fix-v1-1-4d612=
5048fb7@amd.com

> dmaengine: fix use-after-free in dma_chan_put() and dma_release_channel()

[Severity: High]
This is a pre-existing issue, but the commit title mentions fixing a
use-after-free in dma_release_channel(), yet the patch doesn't modify that
function.

Looking at dma_release_channel() in drivers/dma/dmaengine.c, there appears =
to
still be a use-after-free if dma_chan_put() drops the last reference and fr=
ees
the channel:

void dma_release_channel(struct dma_chan *chan)
{
	...
	dma_chan_put(chan);

	if (chan->slave) {
		sysfs_remove_link(&chan->dev->device.kobj, DMA_SLAVE_NAME);
		sysfs_remove_link(&chan->slave->kobj, chan->name);
		kfree(chan->name);
		...
	}
	...
}

Does this code still cause a use-after-free if dma_chan_put() triggers the
release of the dma_device and its embedded channel structures?

If the underlying DMA device has been unregistered, dropping the channel's
client count could drop the final dma_device kref and free the channel. The
subsequent accesses to chan->slave, chan->dev, and chan->name would then
dereference freed memory.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818-dmaengine-=
kref-fix-v4-0-c6ef991462a0@amd.com?part=3D3
