Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C0C3D813C;
	Tue, 26 May 2026 09:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779788746; cv=none; b=P8edGgcerTeXicHTpeRhblOs7iXNNfuW06OushBSj9tXUXxaHnl4y8awAzuMYmRwMpPH0RnKcpWtPP7wPqTc3k4Pv7kcFdC3yTqZKt9wH9GRNl9neCS6O3MCGYLtHTWxS2moGKByQh52ttDr4YxHV8jPXZJbxtvR2Wedkr4FAC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779788746; c=relaxed/simple;
	bh=O/AOCdYrov9JFVhS4ODPjm9Y5GCSlcQ3YEYM47oWlUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A+SpztbCE6L3fNqSeUxEVQqKypUrqmszr5Eyf2Nh7xiVioplpygUkoT7wSZfIbWMY6PW+8SuFDNQ4DBu74viqgPvTqIVEKX6PtSBd6lPh8eqzFcElqTcok47z1NSucq73Hu3tusQ0GUNEGBlunrq4uI9nhCPwDesCO74eZykHLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rk81zGUk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rk81zGUk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F4401F000E9;
	Tue, 26 May 2026 09:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779788744;
	bh=DmT8JLB9pGAh4ytxXWB1YpDnwTGUnwpS66cewTzqsCM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Rk81zGUk071pSgaBGiFqYOZuI8DKEzD2+G4dyIEiMGr5XQ2JfsXvytpvdH6dBjii0
	 9zbi6Gfk2aqk+/VY7Pc4X4XjTwo1I/fUGDiREP+921bea0KHfofeBDtjLxxaVrI8vz
	 e1pKJYKzkKya80+w2zalkpHp6WJ6iLEEfQ6B3gJobLN44/QihycV8uhJ1wBxqEZ56S
	 alh7bvj0v/iawoyKPDAPlzaahF6lfbh9EdEGc5TZvbfG+PksPSXNrBtu+xkeMqwaK8
	 C5G4/P5O3fnJhB/uCNOEOSzx8cYTx41ZcAQhohi+RNsCaXhst9s6Unxle8EyCboYjP
	 DWC9l7wd/mvRw==
Message-ID: <8dcf50ee-94b7-4b27-895d-2448eb772c08@kernel.org>
Date: Tue, 26 May 2026 12:45:38 +0300
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/18] dmaengine: sh: rz-dmac: Move interrupt request
 after everything is set up
To: Biju Das <biju.das.jz@bp.renesas.com>, "vkoul@kernel.org"
 <vkoul@kernel.org>, "Frank.Li@kernel.org" <Frank.Li@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "perex@perex.cz"
 <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Long Luu <long.luu.ur@renesas.com>
Cc: "Claudiu.Beznea" <claudiu.beznea@tuxon.dev>,
 "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Frank Li <Frank.Li@nxp.com>, John Madieu <john.madieu.xa@bp.renesas.com>
References: <20260526084710.3491480-1-claudiu.beznea@kernel.org>
 <20260526084710.3491480-2-claudiu.beznea@kernel.org>
 <TY3PR01MB11346AC919B1D62FADB18FB20860B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <TY3PR01MB11346AC919B1D62FADB18FB20860B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/26/26 11:54, Biju Das wrote:
> Hi Claudiu,
> 
>> -----Original Message-----
>> From: Claudiu Beznea <claudiu.beznea@kernel.org>
>> Sent: 26 May 2026 09:47
>> Subject: [PATCH v6 01/18] dmaengine: sh: rz-dmac: Move interrupt request after everything is set up
>>
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Once the interrupt is requested, the interrupt handler may run immediately.
> 
> Do you mean spurious interrupt?
> 
> After DMA driver probe only, consumer device can access the DMA handle
> right? or am I missing something here?

In theory there could be pending interrupts not yet served (e.g. due to the 
previous usage of the controller, HW behavior, etc). Those could trigger the 
execution of the IRQ handler once the interrupt is requested.

-- 
Thank you,
Claudiu

