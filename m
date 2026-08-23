Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6182934FF79;
	Sun, 23 Aug 2026 08:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787472026; cv=none; b=RNvxkj8Tyc+nsDq8kt3A5sn1DN5Vywlw8CS0wQFCFyIOV/QdfhItNPRu2RflCqU6uwg0D3ReP7coa0eeMmvdwCaawsmxK7xcgGPKk6Fmn+EqSFwXK/y4Ngeo9bDm7V25OcBJlhuLve0ahn669L7nZll81qDd6wDjknYX73jIDl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787472026; c=relaxed/simple;
	bh=FFC8Dpa8j+HItO1md2Diy2DgJU4QJIaXrGki0D+0x0c=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=UZW+qXSZvoNeNmNwrilfAIbYj4k60omxTlbiNJWqVsC/WVLFdZEyeILaTr+ac5cdh2qw1YvuGncLIB8p89agjtfqH3VdZXeA1R1EZ1jPxEgFUdHLJyLY+DgPWJCKibqq4qfEvwFXJWoCYdXrOjnm1pM33noOd0YelV+6XsV8Dxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=H9W5cxfq; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="H9W5cxfq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1787472017; x=1788076817; i=markus.elfring@web.de;
	bh=P3S3MpacU9afvLKHq1/VMEgDI1vKvPhgfplJn0WG7AM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=H9W5cxfqb4mvGBWXXLybp6B+dYR3PknTn+QSr79u1UrmQrIdjXGhio+EiI5JZBn8
	 kl6R1B1iuuLEo6DKUpiNF5n8eCM4JFFZScXTai/hJB2kgM49SJNkmWQUrPkcJBuWb
	 90CmF3JO06ynL3nfD3eneWB/rTdBg0AQd/9OkEPE/MHRXyTU5UpJ8OjLPziqZBBrN
	 7ci+JK23ocmKLd7/S6KfiNGajqvPr108VNnsuwK2ZC1s7aDJgD6sH34DtOFRPo+EL
	 7wMVaSARFgV1ir9WYj2BNHWH6vF3ZY9aPlfopkuxmDiPWjYY+l8VGwR2RhWY+wsHG
	 WTZM4FPJ8s92Z2GpmA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MRW6L-1xLVxM0SBx-00QfYG; Sun, 23
 Aug 2026 10:00:17 +0200
Message-ID: <8735371d-b466-4262-818b-f854c83e23af@web.de>
Date: Sun, 23 Aug 2026 10:00:15 +0200
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Rosen Penev <rosenp@gmail.com>, dmaengine@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Frank Li <Frank.Li@kernel.org>, Vinod Koul <vkoul@kernel.org>
References: <20260823044900.11466-1-rosenp@gmail.com>
Subject: Re: [PATCH] dmaengine: bestcomm: ioremap early
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260823044900.11466-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AnhTOVKCvnOYwpYZ+Gbv+/FltmuFHqL2MJ1aDi8BPnNDINGQoTz
 y/INS3WRXxurJQOGg+51C5fzdA5yLmmDAafeJtngIVBPynYAvDsw2XRttjxJrx4XiBewnuj
 a65+RSeHMaSrW0/tF6d7yU62bibeGhiQkqaK7KuxJTVr6/yclf3H5td8q+FqI4DA5ZSkP+q
 99eeeafbhww7YdXM0pObA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7E+Di4PMhr8=;CecTcKySsG7opRZw7MTS2dSK2e1
 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
 8JuYz0XZqK4/70UXMa66IVa274h9GH1Is7hBfE=

=E2=80=A6
> This also fixes a resource size mismatch between allocating and freeing.
> From sashiko:
>=20
> >  	release_mem_region(res_bcom.start, sizeof(struct mpc52xx_sdma));
>=20
> This is a pre-existing issue, but does this mismatch in size during rele=
ase
> cause a permanent resource leak?
=E2=80=A6
> ---
>  drivers/dma/bestcomm/bestcomm.c | 45 ++++++++-------------------------
=E2=80=A6

I would prefer a clearer separation between manual descriptions
and tool-generated data.
Can quoting styles be improved accordingly?

Regards,
Markus
