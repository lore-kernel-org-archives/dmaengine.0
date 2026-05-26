Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91183DBD46;
	Tue, 26 May 2026 10:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779791159; cv=none; b=Sx+T+tWurw0bABM8SWtLIlytht0eEkMg+g/MEQasvM2HFeNppZpjyjeGm6GzDl2E9ulFSir7ikU6lZtROaQUOLF+FJ1rBKCMBMaRqoCW4C0R02gwbJYrtD7kuBqDcIoRXuhOFrZjDfo89R3CeySTCfmtTzJTrwuqqE7Fm5NXzq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779791159; c=relaxed/simple;
	bh=gmQoQzsMPjGR/xUNYZs6D4VENZ7rn3xPTVp/FXyI4t0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZWjH/Hd9svHbmBNg3Uows1lrGWdYPqpucx4Hf1xCUcwZpAVu/Aic9ybB+7lRYZ3SC244UyypY6n7L8nVbx6g8tBhb8htmqXW4/3IlaNSMmzwF13EShZCxeK9siU6E01cXQZvJRRvkw7cFkQgMTjo5BXNucpDd+X6irHRfyVJpRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oIMni9ar; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oIMni9ar"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1603D1F000E9;
	Tue, 26 May 2026 10:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779791157;
	bh=t9FK9F0ke4Xrw2vcz0cJ/gpSi8fMZ+REQg2xafa71aQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=oIMni9arI4j1O+RUC0GS8hzWwEwGMcAUb1O9umjBUzW+9W+XgkIK3cbjbLU94CBWF
	 pteGlsMocMOifalk+AoTzboPWohTKlcqnEL7oqvgKuwEsnLS12h1pg6gRydJYmQR5C
	 lnJlAt9j5+mjWgi8Re6XyDMron/+MGAQu8NdZHVdt1DwfB1vTm6lEiDGXby8BgIJLk
	 fIfu1vzPk0lOJgVUSptv5R/Fkr44TrMA/iOMQ65IvStY06NpwwOsF9OlUdEAR8Vwq5
	 MF3lG/K5sqOZ4/4QF0TzzAMhfY5ShTyKAD0SSzG3ewuPsOevZ0mDNOUsymwiwLsnsF
	 R+lC2dvAiQ3PQ==
Message-ID: <a3bfb7a9-9980-4dea-aa14-c5973cf80638@kernel.org>
Date: Tue, 26 May 2026 13:25:51 +0300
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
 <8dcf50ee-94b7-4b27-895d-2448eb772c08@kernel.org>
 <TYCPR01MB1133214647B09C658AC96A4D9860B2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <TYCPR01MB1133214647B09C658AC96A4D9860B2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/26/26 12:51, Biju Das wrote:
> Hi Claudiu,
> 
>> -----Original Message-----
>> From: Claudiu Beznea <claudiu.beznea@kernel.org>
>> Sent: 26 May 2026 10:46
>> Subject: Re: [PATCH v6 01/18] dmaengine: sh: rz-dmac: Move interrupt request after everything is set
>> up
>>
>>
>>
>> On 5/26/26 11:54, Biju Das wrote:
>>> Hi Claudiu,
>>>
>>>> -----Original Message-----
>>>> From: Claudiu Beznea <claudiu.beznea@kernel.org>
>>>> Sent: 26 May 2026 09:47
>>>> Subject: [PATCH v6 01/18] dmaengine: sh: rz-dmac: Move interrupt
>>>> request after everything is set up
>>>>
>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>
>>>> Once the interrupt is requested, the interrupt handler may run immediately.
>>>
>>> Do you mean spurious interrupt?
>>>
>>> After DMA driver probe only, consumer device can access the DMA handle
>>> right? or am I missing something here?
>>
>> In theory there could be pending interrupts not yet served (e.g. due to the previous usage of the
>> controller, HW behavior, etc). Those could trigger the execution of the IRQ handler once the interrupt
>> is requested.
> 
> You mean DMA consumers configured by bootloader and linux probing the DMA driver can
> trigger IRQ?
DMA used by bootloaders may be a valid scenario, even though may not currently 
be used in the setups this IP is used.

Please check the documentation of request_threaded_irq(): 
https://elixir.bootlin.com/linux/v7.1-rc4/source/kernel/irq/manage.c#L2089

"* ... From the point this call is made your handler function
  * may be invoked. Since your handler function must clear any interrupt the
  * board raises, you must take care both to initialise your hardware and to
  * set up the interrupt handler in the right order"

-- 
Thank you,
Claudiu

