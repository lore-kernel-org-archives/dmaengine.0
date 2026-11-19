Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795109271;
	b=3Vz9dDlvaFWIjDAh444OYx5z3if5TowWUJpDdS2ph0asSd8K1bOO+U1Z/cGaIpC4SoIj
	 1xdKgjYTFdKLKWE7MXS7RMGS9kRUr8L2wspnQqSHd1EPRgHblCCsyLrTuS7KWVrM8AbcJ
	 JsdaljxrA+NtbsiOfPRLaMhSzDYD6rZ7B08n++h3OOjje7A2f1Qcbimwa/TOnFND96twZ
	 9b6u1zUfkcWQE9SQqe9N7gWKXZLny8rWHyEnbO6Ehi/1N9N8zlw7sdafriofPpp2/FsGj
	 LvBIpOuAVyrJS7miOLf6xIjawFccjuSS3l+LKrWIgTIe1pYXez2/EYyg41r7QnCpYaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795109271;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=g1ZELKNUIXC4/U0uYoWAfqJrgChz6eS/OmzcfGEfVwQ=;
	b=mfyyBjeaOAo5pKzlTPQmG/kyQ5QdjZLIy33EyB6DivKt0dKx7B4N9XJnEXjhS4PhX1D0
	 H3yXWJ3MhWh+erNaC8A0A5t+tG8mawQ9oxpmBgLz/b+hWvYq/Nvi99Zarsz+pTA3nU2p6
	 ObdRm2BPJ4JC1DfxNXkwU5UZx1NDQBfIz5sS6Rip+VAp9Z7Roh9sX95G+Wnb1HEMNDrzr
	 Q2p5c9RnW7bX6TyV5OPT7acb61ToO5QdDeij+lIr8pjL6A7chpF1vJfNtB7jRamjMtvWs
	 NQ8FrxIAhNUnn/hGf8jxxwGxNYCFZeVM4bFLagj8wJHP/OuNGD5oh51u0mWAijwiDbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=ZDTtBh2r;
	arc=none smtp.remote-ip=212.227.15.4
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03845606A320
	for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 17:27:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03845606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=ZDTtBh2r
DKIM2-Signature:  i=1; m=1; t=1795109267;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGRtYWVuZ2luZUB2Z2VyLmtlcm5lbC5vcmc+;
 d=web.de;
 s=s29768273:rsa-sha256:M70omDkop1kq9RxobuWaYLtCf1n6
   zU2qheNNIRe6VASJMbWoiwxyJ0Kz/bj4lnRN4OxvST/Jgn2O9rGcHGHCSeFP5yLxyzqgEFnn3Yg
   ruQyIoOB/O0zRUExCApTiaNS7l54Yza8wLK2oQI1zTggALLPfNv8r/dL9dOa5XM+7Wl2/D9jaAR
   CCMhf9QDfyDc0jBiyKrxO4mGxafBL1NOTRhY/r/Z3sxovOJ7mf/6cgBduEG9H1YNt98Puh5RLBE
   MCbkwvMO8YMwQjfo6lSG4wyunTR0r2kZ5R9qKf0a9kHa9Dw54zrf6xAfqS6eCzzcUFjt/vtfoLA
   PGOka/wiTiQJIA==;
Message-Instance:  m=1;
 h=sha256:
   3M927HYv1qB3vqaDY6vUWWsfDiQCnZyeiE49DjHGPoE=:
   4FHgqDzdOH8q6hetk190VIQidSClvxbNHvItmtPPZsA=,
  sha512:
   pCEzJTcIqKo8Nb8Y1JVQTAwmAkiuENXjTat1UlP1b/D0TvBffWW4KJajiQFjKdek0R4CEPQ7LpKPUJTFgwK/7Q==:
   wyVoCcEMTUbydfdcEdWo+707WAcwxHMT5gIrazgzlCXYHDPJlM3hW50oWodsJlvfCACDpcomN0hgTCg7kXbbZQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1795109262; x=1795714062; i=markus.elfring@web.de;
	bh=g1ZELKNUIXC4/U0uYoWAfqJrgChz6eS/OmzcfGEfVwQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ZDTtBh2rvOh7PfheNAAZPKdzoT3ZJ07N0RUYFzdqlUmllHnDLUudSNJVtO4ee1wx
	 sM3Tv90tLcHGds8AbjA1unsC18+zIjJUOlxGo1lfXiVoAL4p3BwjDVlGJ2hzDfxM9
	 uALCGThl3oqLVKmnMNcVGWZzRITgOtAe+d6zMTmhke6o4iA4Yq5log2dejB54DRoi
	 U/slRjxKgXSwg9xGpILP794PR+0mvRrdo9P8zsM5IkUBtyLPNXNaGkdcPNSUdMhSO
	 jYPtLdw7l0b5HQuTglbdId96bKR/y5rPb6BtAi+Zd7tDe8lhfvKIQJcUre3H1rl5t
	 PRUP0KRVB2L560bayA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MNfUF-1x58Hm41xj-00Pegq; Thu, 19
 Nov 2026 18:27:42 +0100
Message-ID: <c5e756c6-2449-4079-a924-15a6bfdef848@web.de>
Date: Thu, 19 Nov 2026 18:27:40 +0100
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
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 dmaengine@vger.kernel.org
Cc: Frank Li <Frank.Li@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 kernel-janitors@vger.kernel.org
References: <8e3534b7-ae64-4c1f-819d-0ba390737b84@web.de>
 <av8u_xgva8ORkzaC@ashevche-desk.local>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <av8u_xgva8ORkzaC@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7MCaKysmWOEzDrxCMq2rG6S1XqFp97qJg+suVmgA+sy4l9L9TUV
 LUZtY7stmgBwr/J6R6Kj1F3uQD5tOBlDWNWGvA8wLAzaEzNJ97jK3gezzUex5gxakrGgKag
 YWS6a8o2u71vY3QXdqwQ37RACP4vtqOC5UDeAA8Fxb/G86K00g5Syi5Y5onyP3fucrNJ6/E
 7K9FZfzs14POsZcBoBhFA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:RDg97EL3WTY=;5JsQTGXTzPD6E9RwFb/NTWIDOoJ
 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
 XVn+yXrkiw==

>> Reuse existing functionality from devm_clk_get_optional_enabled()
>> instead of keeping duplicate source code.
>>
>> The source code was transformed by using the Coccinelle software.
>=20
> Something is wrong with your tools or scripts. It now brings a regressio=
n.
Would you like to extend background information?

https://elixir.bootlin.com/linux/v7.4-rc1/source/include/linux/clk.h#L680-=
L699
=E2=80=A6
 * devm_clk_get_optional_enabled - devm_clk_get_optional() +
 *                                 clk_prepare_enable()
=E2=80=A6


Regards,
Markus
