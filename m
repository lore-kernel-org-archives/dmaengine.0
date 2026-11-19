Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795111779;
	b=qTkpl93SP2x9Ky8NSxRW5oNO+dx6QfgI7NTmQOV6wivg5kFkQ0YZjecjg4M/GxtjqyqI
	 NJI8iL1oGVFJbQbEQcYlyupxdQ6ak2vGh58QvtWygSr1uety68/UH7jmaS5J+16R90Q2N
	 hc3v6iYvtTOywxdaRmf8CJ8ERYkOhNs3s5EYlkIWfRAHl3KY9ttZC7svLIrUvFVsC5aG1
	 vYKC8JbIBAfMUl3rRqk9tpcCeud0EJ1qucn9jaPaZoTUrcd89OgG7+0wpOAZdnBy0c0Px
	 Lq+Cmdk8hBnoJKUevlpt/JUeCZcEK6f8s4yAag6FL4Tvy7OQt1cJmO+5FCE0LvMqQ0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111779;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=4pzlK7APXFFNs8KRHKtFyCyPqMX2Qs7X1T3NN43GZHM=;
	b=cEHQDHCr3zUbj1X8s9J5A/Earpr64KCe5iNLW1lJ1pBesKCMkRT3S7EBBdH94GtoAwiC
	 RX0oH/kB0SC7mrqKgtwhRLP1ESaPRCrPG9i+ZEgjtc4A9KTHBMoY5dlvqYEISKpktOJ1W
	 VrXwtGGHK76jvG7GqIgQdGZqioPU5dzs7/2ken4DisZCJ7+JaQoGRdp5mi02lFbvFzCZk
	 wT2lSc4RlP5I/DQvcoGWNecPv0UO6/UvKqwa8TdqtFKAnZye2HtcRtp7IzqRH0hcP6kh0
	 R293DWUlB25YDrkuCq49xC6LytENqTSEiv+PkogtcmpM7jUyDlKBkpAngjJgdPRTsgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=vmyw12Oh;
	arc=none smtp.remote-ip=212.227.15.3
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E463C606A324
	for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 18:09:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E463C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=vmyw12Oh
DKIM2-Signature:  i=1; m=1; t=1795111777;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGRtYWVuZ2luZUB2Z2VyLmtlcm5lbC5vcmc+;
 d=web.de;
 s=s29768273:rsa-sha256:tfRGWTUQCjKVMdn4IbLPEPS9xa0p
   XaM90rAFK96GrkwbkAap0rj+jG8iomS52dXyuGMIJNqdhTqCS+yQDebvZzmymfkfCeDUpE8TaqG
   eN2vtcfsLBZqLmahv8+MYB91cG+FlLKvVDW4SzkRD+fyrtAGfsMKrP4p1NHKMy4eaxrWBJnwzYG
   wF9u9D6rQFnIXxKxrZSJZpa+tUm4m+MFxpU2be2ZB91O6GZEvCziSqQwVYSFRN/w4TNkVJ/wcmK
   bRnXzqo3hZGQub9IcJ8OitGAbWRI8vcsm29zkADCujOYLoboUMeCG8qBnjfOylwEX0tA8DgtX85
   S1+SNhQNM6UERQ==;
Message-Instance:  m=1;
 h=sha256:
   IJIgimPT7if0rMrwBDlAYcUqTyp7n8+zjxsRor7oyD0=:
   fD+/ALIqYHbm0xPktAw0/uaEfNRiOdjOWoDcBJ8h55w=,
  sha512:
   X0I0lh8lVXaMOqxXw99Qb1NWqE+XzlHj5S3Ibh5oniOnQp0qQSiIG3HS6xrHFv8k3BS7/Pv5i4uzKCs5QDttLQ==:
   l00xTuG4iPJDbekjLeNFE4ai8iYflAfhC6agtLhM6Wv9hYRUJWL+veX3+6L1f3zuh/mt5II2wHrMQxCFT/iayg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1795111761; x=1795716561; i=markus.elfring@web.de;
	bh=4pzlK7APXFFNs8KRHKtFyCyPqMX2Qs7X1T3NN43GZHM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=vmyw12OhW8beDcEMsY8/7JQB2oESku+HPHiuBZ8GqwS1jZ0KZ6SmNXj1po2nOltx
	 gm5hHBkvuqUfdKUOKstigHOmE60zjDKw2wDZaKGQGLwTDRTlVuiQzq3zMcw4+3wy/
	 moHPbUrQDmStArjwmD8NoGanZhZpy3VHztAwGyqeHlnjRGxjX7lJBajZt4Ucb+d7J
	 F58K8yPDq13llV2351oC90rLQicZX03BLXq7r+zalP08N4fmql8LBqvWp+W2GlAkG
	 rs3CqePOe181TZ6HEiHF9A3RaBCh3sJvIa1SSxtcInU/uBXww6uRn9IbGblzbYvBf
	 Gxb80Y8mRKmDIfIfKQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MBjIG-1xHy283k6O-004vnH; Thu, 19
 Nov 2026 19:09:20 +0100
Message-ID: <1e2fe486-f497-4263-b759-5876f2f5bd2d@web.de>
Date: Thu, 19 Nov 2026 19:09:19 +0100
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: dmaengine: dw: Use devm_clk_get_optional_enabled() in dw_probe()
To: Frank Li <Frank.li@oss.nxp.com>, sashiko-reviews@lists.linux.dev,
 dmaengine@vger.kernel.org
Cc: Frank Li <Frank.Li@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <8e3534b7-ae64-4c1f-819d-0ba390737b84@web.de>
 <sashiko-outbox-223487@kernel.org> <av8pd_aQFFSSMkDg@SMW015318>
 <216e7cd0-10b9-45a0-9eba-b53cbc6fda4f@web.de> <av804gPG5A8_8UkG@SMW015318>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <av804gPG5A8_8UkG@SMW015318>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wfG2JC3LwFQSM/sUiAqXL8/9Fp5UEVDJLeg95C7r97BRdqMl0UB
 8+ljVb9cvjLbfrZkGj012hWvz0bvce0McSr2WlpMofmn4a+OKbj9YKy4N7eTyUynx0P4F06
 IuamYEBrPcbaRTlngU2yJmnaeDEGj4ZSbMwELyYCyU95KGwKFl/g3QMEX1WqYR/t6u6yXiS
 x15b5PnqNiXm6gX5JHOWA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:4ERn8dNs6NM=;dImiIZh4Kbe7GU4B4Rhj9IXSzkt
 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

>> Do you find these two function calls really not equivalent to another k=
nown function call?
>> https://elixir.bootlin.com/linux/v7.4-rc1/source/include/linux/clk.h#L6=
80-L699
>=20
> What's your point?

I wonder why the cleanup procedure would need to be different after the pr=
oposed refactoring
for the implementation of the function =E2=80=9Cdw_probe=E2=80=9D.
https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/dma/dw/platform.c=
#L24-L92


>                    Sashiko just remind you need remove
> clk unprepare at error path

It got the impression that this function call would be still relevant
(behind the label =E2=80=9Cerr_dw_dma_probe=E2=80=9D) according to a faile=
d statement =E2=80=9Cret =3D data->probe(chip);=E2=80=9D.


>                             and remove() function

Do you expect more functionality from a devm_clk_get_optional_enabled() ca=
ll
than from the combination of devm_clk_get_optional() and clk_prepare_enabl=
e() so far?

Regards,
Markus


>> =E2=80=A6
>>>> --
>>>> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/8e3534b7-ae64=
-4c1f-819d-0ba390737b84@web.de?part=3D1
