Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.8.165.127
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793300285;
	b=1TMfapzjhhlGN4F+gS+3fn4cbGtu8yfUHE13USpHd+1em59G6tRGUhWkgpNvGB0YanqU
	 vddrDk5BN/H6WxYzydPi7N2f4fNbPV6tlBZk2RmX3wSl1L+HXyOoR0jKEoDv819h4VvQK
	 6fSAxbygwyRIDHWS6wkduocK7WLeP11BcJDUTDS8osF4Ex+sBidVu009xJIUEDDaV4V1P
	 maRohh+50I1fhzkSdPUtpAppApn8NrC4HiqMWPq+pBDkCROFPAMCoMw873X/LAr3qQAo5
	 rheAtqSKN+AUuyxsgYEX7k3VPQrbZE+ldlS+09wLw1LCV/j5qr5XldcMY0xI/LVuskA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793300285;
	h=DMARC-Filter:Content-Type:DKIM-Signature:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To;
	bh=xLvov9pGQVWJRUj6Y3jHi2u2dTJ7wJc+w9q03YhUAu0=;
	b=FYxQcxe4903goai9jUp7FtTKVOqtUgmMBo36BaqCqClDFt6bS6c1Gc6+7NXI0Iip4wSm
	 MvSYCPRnfVNsYe/fHIZk0yUT+tlr/T3ljuUSSvnHlEfqyQKAqbnvr66AGVJPp3S0JdVlp
	 lmo6XkgAxrFwiJcTiUJy5By/FzOs+43LpVYX0k9JhYF+T55HRiulGo9JmCjjH6cMw+XcE
	 JXpGGML5DHt8BzIR5XG1Vo9hkYqaqRqg/w00JJar9kyOVJbBL+eP0bidAETKMgcNd1yf8
	 UIa0gGAX1tNwo6cwRbNIURFXSzCcElKetwsjG5K/qn75KS3CMAaDYS+O6RjQKIQU3cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cutebit.org;
	spf=pass smtp.mailfrom=cutebit.org;
	dkim=pass header.d=cutebit.org header.i=@cutebit.org header.a=rsa-sha256 header.s=mail header.b=EEnDX0BS;
	arc=none smtp.remote-ip=185.8.165.127
Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A13606A31C;
	Thu, 29 Oct 2026 18:58:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57A13606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cutebit.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cutebit.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cutebit.org header.i=@cutebit.org header.a=rsa-sha256 header.s=mail header.b=EEnDX0BS
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1793300274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xLvov9pGQVWJRUj6Y3jHi2u2dTJ7wJc+w9q03YhUAu0=;
	b=EEnDX0BSYpOpB7ttnQvTF5RTelXI9oJqBT5f7zLI1630qhiiHldNhXesO3+y5lTPTo1Lgh
	zoOk057PwCWEPRJM3LMuu2cRGwr9o/Fa0FD5UXy4Rk02bD9wtPqYS5huuyjetR2hKdF1sD
	c+fZrxJzhrdmSMidrW8Idt6WzI20Vjc=
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.8\))
Subject: Re: [PATCH] dmaengine: apple-admac: Fix position one period ahead at
 period boundary
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
In-Reply-To: <20261029105908.22809-1-sn125164@gmail.com>
Date: Thu, 29 Oct 2026 17:10:21 +0100
Cc: Vinod Koul <vkoul@kernel.org>,
 Frank Li <Frank.Li@kernel.org>,
 Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>,
 asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <E5478149-FA00-4A41-8CAC-7E8CF8578473@cutebit.org>
References: <20261029105908.22809-1-sn125164@gmail.com>
To: Jacob Procee <sn125164@gmail.com>


> On 29. 10. 2026, at 11:59, Jacob Procee <sn125164@gmail.com> wrote:
>=20
> Speaker playback on a MacBook Pro 14" (M1 Pro, J314s) underruns at
> irregular intervals, audible as a tick: 8 times in 3.7 hours of
> playback. Where an underrun was caught (4 of 8), the ALSA hw_ptr had
> jumped by one buffer size while about 70 ms of audio was still queued,
> and a kernel trace showed the DMA position stepping back by exactly =
one
> period at each of the 6 underruns it covered.
>=20
> admac_cyclic_read_residue() derives the position from the report ring
> (periods finished but not yet reclaimed) and REG_RESIDUE (bytes left =
in
> the current descriptor). When a descriptor finishes, the residue first
> drops to zero, then the report is posted and the next descriptor is
> loaded. Usually the last two happen together, but occasionally the
> report comes first.

Hi Jacob,

this is an interesting change. I agree with your assessment that this =
boils down to assuming REG_REPORT_RING and REG_RESIDUE get updated in =
one atomic transaction after completion of each descriptor. To my =
recollection, the driver is written assuming this behavior as a guess. I =
have reverse engineered the block's interface by looking at MMIO traces =
and by direct experimentation, neither gives certainty on this point.

Rewriting admac_cyclic_read_residue to avoid the race altogether would =
be best but until then, your change looks to be a strict improvement.

Feel free to add
Acked-by: Martin Povi=C5=A1er <povik+lin@cutebit.org>

Best regards,
Martin

