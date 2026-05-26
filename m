Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91E2324B32
	for <dmaengine@vger.kernel.org>; Tue, 26 May 2026 06:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779776658; cv=none; b=ZkEmichqWnsHtk439p/kTWL2O5Dmks0pGQpKzZ0ZB/GApzJGZmp57OPSWeVVlD1PAClXC85LhfxnrwPdxPzqqUPn2uNR3Osu0Ek5RBQ2ZjFWO8oQo9AsEQh1impl6F/YOHvL6ZajGz+hUEugambX7oI8PwteyNqU6n3rhoVTOX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779776658; c=relaxed/simple;
	bh=dbwK/9YTPcwEKvAdj6NtzsY5ieyKmvgvtiRLvAC0ZeY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Mz5wRmFOwawY8HSgAj8ouzmmcWxonf9TcBzsQ2M+v41TAh0A+xAe9/Zy3u1p7LuoHedmk/thtrqj4pBQ/tFNWUJTWtJRX6ywkwiBP48d/nmFNFMjBkYsOgTSKedRRcdgFgd219IAR1ghaQCFPXFGva6VXXk9x13h4weJzTH9aVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y3T33QXu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y3T33QXu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47C311F000E9;
	Tue, 26 May 2026 06:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779776657;
	bh=x5b9FLoHnFeELtvIhHvAQ3s6UvnQtCfb7PDV1kvtyRk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y3T33QXuINreCAlAe1D1qvlo0/Rmf6XnhSUDlyYnmViRKPS6OE7XMNI0TNIUwFGMI
	 l4OgPhRU9QloqrvWcCJARjonHFapVEIMAi0vfdtHn+/c2liLLTPp5dY1mvi3RIqgXK
	 JzrVXLW+EqNcejIHDQdohn0bkWBw5cllLPKVnuWyP+a3QXJzIrM+xkKTv6JaYRwBAZ
	 ZHdmPIDQCvmJ9gmCArfWp/jPZhQlkOebql1ixFLuRQwaWjD/ZBosGscTuaI7dngNvY
	 h7rqLqYVC28fF7auB2V6AlXwXNoUZc+Tys2x4xbBq92BvBvteKieIS5gG6dsECyAnZ
	 p/Zb2TZRPt6CQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: ioatdma: use !kstrtoint(), not sscanf()!=-1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260526061321.6123-3-grandmaster@al2klimov.de>
References: <20260526061321.6123-3-grandmaster@al2klimov.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 26 May 2026 06:24:16 +0000
Message-Id: <20260526062417.47C311F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The sysfs store function silently ignores parsing errors and inc=
orrectly returns success (`count`) when given invalid input.
--

commit fe01246cf60369a73aac5e63b92278079b4417aa
Author: Alexander A. Klimov <grandmaster@al2klimov.de>
dmaengine: ioatdma: use !kstrtoint(), not sscanf()!=3D-1

The commit replaces the use of sscanf() with kstrtoint() in the sysfs store
function to parse user input. It also addresses a checkpatch.pl warning
regarding the formatting string.

> diff --git a/drivers/dma/ioat/sysfs.c b/drivers/dma/ioat/sysfs.c
> index e796ddb5383f8..f59df569956ae 100644
> --- a/drivers/dma/ioat/sysfs.c
> +++ b/drivers/dma/ioat/sysfs.c
> @@ -144,7 +144,7 @@ size_t count)
>  	int intr_coalesce =3D 0;
>  	struct ioatdma_chan *ioat_chan =3D to_ioat_chan(c);
> =20
> -	if (sscanf(page, "%du", &intr_coalesce) !=3D -1) {
> +	if (!kstrtoint(page, 10, &intr_coalesce)) {
>  		if ((intr_coalesce < 0) ||
>  		    (intr_coalesce > IOAT_INTRDELAY_MASK))
>  			return -EINVAL;

[Severity: Medium]
If kstrtoint() fails to parse the input and returns a negative error code,
the condition evaluates to false and the function skips the block.

Looking at the remainder of intr_coalesce_store(), execution then jumps
directly to the end of the function:

	if (!kstrtoint(page, 10, &intr_coalesce)) {
		...
		ioat_chan->intr_coalesce =3D intr_coalesce;
	}

	return count;

Does this silently ignore parsing errors and incorrectly indicate to usersp=
ace
that the write was successful when given invalid input?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526061321.6123=
-3-grandmaster@al2klimov.de?part=3D1
