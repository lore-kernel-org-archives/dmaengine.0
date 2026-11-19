Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795087608;
	b=5Q5YT08DnT5zDeif9GAyZrpCJe0YuOZkXvHQldbzKEoC1JkWrp7ImEZNJvTNFxNpXq5T
	 y/vF4WDdMQliBFKDyp4lf6VYeHL+rbtxLzn7IZlucFeM8c3jbMj2neG9/kS6OW2CuTb25
	 /21zAtq2u2Qt8Qyq0G7b/NTv5Mj3kcBYK/opPB596DWifrb99B1mLYkQ74gIz97wVVDck
	 ypw5tY9tl1G3qPTxvdLEGe2gMRyuWSwHxt+Fzeg9IeNCmQAHgCgV19eqpWslWZvENhlsn
	 miCvw0aOpJ/nb+C84h737EUgfJnxFnLz0Un/KC76RFgJ+jqWNDXyqFHKWmksbN02x0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795087608;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=hihMc8xWalFD1jLREOEPnQmXRmKw1wLBTGaYMA7TzEc=;
	b=ZTsqYujF91LKQWBXpierkKmBzOhPzWFSUwMuHS76EDXCMgox2ufZKu2Ovbj/htNs5Xlq
	 RlFrY48PNkZfq04lC63TfdG383HE4R4YN3Yc7nFg9KYVd0EGr6spQK1tLoef6IZnsUPT0
	 l4erLfaSIM02Eu7EzYPQ+eNTbYRrMGYnLPFycXvd4la67UDwBJ9wTtIGOglXY2waw5Rvd
	 RuJqor8KGurW0jv3oZhu14YvjsjBSB/hqrKOQzlQpUJ92bU3Z7dmku4wlcABfYxpCmzxO
	 KQowwVwrsiDhEhrHRws8JXX8QvoVhH46JeiyBEhJ84aDh7U+t7k3FeTOv3VK13hZybg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y4IXuzwI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8B2606A320
	for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 11:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y4IXuzwI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F17EE1F000C4;
	Thu, 19 Nov 2026 11:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795087608;
	bh=hihMc8xWalFD1jLREOEPnQmXRmKw1wLBTGaYMA7TzEc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y4IXuzwI35RXCjOJH1gUypP0PyLYHaPXT6Fz9+KEM4j4v+yZ0xsmzLpRpmUmm+pP/
	 A9Dru7Q5WBTuvNbPJ7QUe21guyGrFevA+umWU+45a6Ro3d9qluIA8sk8HWoUuSeotP
	 KIHyt0z6t6fhQEiSf9wIsC1vDaMI2PXqSBjPQAGEWimRwM9Sdi6YkPPBYuYOuTKAQn
	 25gamgjcxhusvIurPbOp4SsNN9WBCE8lhowlDoI/kPASqWUpJZOl589XomXgbuc+2e
	 ViSmrAVxkxYZijXo4Zrdq2DaLVd6WmWWvOGnpX+Mbk6djl0aGt48Lm+W2dTvnYiGx1
	 Tkc6/Z1AgdyhQ==
Message-ID: <sashiko-outbox-223029@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: idxd: Restrict DSACAP reads to DSA devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guixiong Wei" <weiguixiong@bytedance.com>, dmaengine@vger.kernel.org
Cc: vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261119112212.92663-2-weiguixiong@bytedance.com>
References: <20261119112212.92663-2-weiguixiong@bytedance.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 11:26:47 +0000
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
- [Low] dmaengine: idxd: missing Fixes trailer for unguarded DSACAP
  register reads
--

commit 20d136fa0348a2bd1e8670da1c059a69c7edbff4
Author: Guixiong Wei <weiguixiong@bytedance.com>

> dmaengine: idxd: Restrict DSACAP reads to DSA devices
>
> idxd_read_caps() reads DSACAP0-2 whenever the hardware version is 3 or
> later, regardless of the accelerator type. On IAA devices, offset 0x180
> is IAACAP, which is already read by the separate IAA capability path.
> The additional reads populate DSA capability fields that are not used
> by IAA devices.
>
> Restrict DSACAP reads to DSA devices, matching the device type check used
> for dsacaps sysfs visibility and SGL support.
>
> Signed-off-by: Guixiong Wei <weiguixiong@bytedance.com>

[Severity: Low]
Since this fixes the unguarded DSACAP0-2 reads in idxd_read_caps(),
should it include a Fixes: tag?

  Fixes: 8308510b9365 ("dmaengine: idxd: Expose DSA3.0 capabilities through=
 sysfs")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119112212.9266=
3-2-weiguixiong@bytedance.com?part=3D1
