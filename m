Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.8.165.127
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793637629;
	b=fHK2ggdS8OkNhNRXWyI20523aMdDVPQPqHTv14oc7LG00Rw++ZzN/95UODR4eGc/+UP8
	 2X0M1KZF5LCzbpCfbigevyaCklzLVW63UimMcM/fyNDVVeU6bwSF45d7W395MpQZevp5D
	 382UZ0TIVNd+ext0E7luMioBITETcwjAevUJcNZUcsRcEohXfcEqRhD+D1j0E4W8NqjjJ
	 AKhnxphvRCVHb2jdQo4AHvMMf1jawG2pbcvE5uNXSH6et9BcF+lrfk7WCR9E0V/KkHlGq
	 I5YG3f/wTU3HYCZofOdYGNOpqjDx9RcrWFLKuntwfMSnqdsBxjsaeJdeK8eXlDlwe1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793637629;
	h=DMARC-Filter:Content-Type:DKIM-Signature:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To;
	bh=+8z6SUsF1e/REU3gcCFgmzFmcfdajlFQZ+TsooPdb2w=;
	b=kJESWctg0c4syhEjyYGFNOlLVuJl1s/IZY7iwuGiRU9t5Z8YiRns4z3UibsqGZZMUcj+
	 kmdWOpWi1WRnjzLOlyrllzqE/WPmO0uJfaVJqu2QApyp4yt7Kv+zzk9dLhD2o3IzToFkF
	 /k1bCZ3Tws249/JhnlZno6oIVR8chAiZKj+zDwaGsTo3YKAon8Rla1h52myEb2KMZgEg5
	 lyJXeMv9ECtF00FzP0FpDPA4u9H0xM1Jq9IPDecxACnNvu19QCYjUMUCeKUSkB0QDboqb
	 yw2+4BKDJFjbxnvuN7HZDgkIpwT9cDs4tx706aieQ9ZaEFg4Ezm/Yd0ng7+NFJXx8oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cutebit.org;
	spf=pass smtp.mailfrom=cutebit.org;
	dkim=pass header.d=cutebit.org header.i=@cutebit.org header.a=rsa-sha256 header.s=mail header.b=m8cVUxk9;
	arc=none smtp.remote-ip=185.8.165.127
Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB7460A1DAA;
	Mon,  2 Nov 2026 16:40:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CB7460A1DAA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cutebit.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cutebit.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cutebit.org header.i=@cutebit.org header.a=rsa-sha256 header.s=mail header.b=m8cVUxk9
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1793637619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+8z6SUsF1e/REU3gcCFgmzFmcfdajlFQZ+TsooPdb2w=;
	b=m8cVUxk9LKNEPr3m/MR7d88NgB2/WgdRjvRmOB9r9o9ddnqU2g/Jc5PeRP+X+92RTHuEC0
	76ZngKKW8wXzobtKVmm0T+I94y/qsJuLY6033Nhy0cTHOxX0Xo81VfGCLYN4Je2dql/u3Q
	GW+69BEZsO9PmYrV6widckXt7OdWRxI=
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
In-Reply-To: <03f2dae1-453b-42ce-a3fa-e444906bb1bc@gmail.com>
Date: Mon, 2 Nov 2026 17:40:09 +0100
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
Message-Id: <774174DF-C530-4BA5-93D5-879D3D4E27D9@cutebit.org>
References: <20261029105908.22809-1-sn125164@gmail.com>
 <E5478149-FA00-4A41-8CAC-7E8CF8578473@cutebit.org>
 <80246e46-8b9b-4cc8-b3a0-b07f9e5aaf8f@gmail.com>
 <03f2dae1-453b-42ce-a3fa-e444906bb1bc@gmail.com>
To: Jacob Procee <sn125164@gmail.com>


> On 2. 11. 2026, at 10:45, Jacob Procee <sn125164@gmail.com> wrote:
>=20
> On 10/30/26 08:35, Jacob Procee wrote:
>> Thanks for the ack and the extra background info. I would love to =
take a
>> look at a race-free version of admac_cyclic_read_residue() as a =
separate
>> follow-up patch; v2 of this fix follows shortly.
> Hello Martin,
>=20
> I looked into this using REG_DESC_RING. It only contains descriptors
> that the hardware hasn't fetched yet, and its read slot is effectively
> the hardware's fetch pointer.
>=20
> Unfortunately, it isn't updated atomically with the residue reload
> either. Across 1.49 M reads, I hit 126 period boundaries. In 4 cases,
> DESC_RING still showed the old state even though the residue had =
already
> reloaded. In another case, DESC_RING had advanced while the residue =
was
> still 0 and no report had been posted. So I don't see a way to get a
> consistent, retry-free read from these registers.
>=20
> One could make the retry check more comprehensive by using three
> counters: outstanding =3D queued + playing + reported, with playing =
being
> 1 unless the residue is 0. This would also catch the reverse ordering,
> where the report is posted after the descriptor is loaded, which the =
v2
> check doesn't cover.
>=20
> However, I left the debug module running overnight (10.65 h, with =
music
> playing through the speakers), and never observed that reverse =
ordering.
> There were no XRuns or backward steps. The speaker channel had 96.6 M
> reads and 15,483 boundary hits; the second channel had 29.3 M reads =
and
> 86 hits.
>=20
> All 1,498 snapshots that failed the three-counter check were explained
> by read skew: 822 where DESC_RING was read before the fetch while the
> residue was already full, and 676 where it was read after the fetch
> while the residue was still 0. The positions returned to ALSA never
> stepped backwards.
>=20
> Given that the more complicated check would only handle a case I =
haven't
> observed, I'd prefer to stick with the simpler v2 retry.
>=20
> Unless you know something about the hardware ordering that these =
traces
> wouldn't show, I'd prefer to stick with the simpler v2 retry.
>=20
> Kind regards,
> Jacob

Hi Jacob,

I don=E2=80=99t think it=E2=80=99s worth doing the more complicated =
check either. Your v2 patch looks to be good enough given the available =
information. Perhaps there=E2=80=99s a way to do the residue read race =
free by involving additional features of the block incl. registers the =
driver currently ignores but until someone discovers it I support going =
with your patch.

Best regards,
Martin

