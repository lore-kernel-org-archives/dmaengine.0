Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDB744682A
	for <dmaengine@vger.kernel.org>; Tue, 11 Aug 2026 14:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786459427; cv=none; b=KijPbGN0eS3sIJE6neBkY3kTFoui43e4q7e185+mdvr/ZUG1hEbbyoy3xiRmn8hlUMXpVhXvGxj9dtZIOfOANPShUZBG6abf5zql/1f/oEXuFBo8QFyf4o1buDRx8YocUyZNAoy6jS4K86nBzty9iEJ+HzBkcsH4mnDO/WJnatc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786459427; c=relaxed/simple;
	bh=SCErz/lEB+RJNPUQgs9cila0J4Sl6vkI2ElAH/kk6kQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qudQezNmTPHfGCka01yb7G2UHDl4kZVY7OG66WYPCHM4DGmV2oIzpq8iDbA+vBrvQIkx6bcioQm4J3qGtoiIEdO7wR5R8xxIE2/gmrvklkT5ZWdzIM1R5WjAwhNwGMy8JlO6pWWcERjka+cDrGHj7+BmCgjxi1jpxWJvio8Lq6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Cjsf8LKP; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Cjsf8LKP"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso23917695e9.0
        for <dmaengine@vger.kernel.org>; Tue, 11 Aug 2026 07:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786459423; x=1787064223; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b8sneHjVqgUcdPxNAhatfJbmM4A537AhZlt95Q+odiA=;
        b=Cjsf8LKPSGazSilTHJGFIUGzJfz6Bc/wRoFG2dHT2EZ9k7zL7WVUQ7jL5F2qNFp3cH
         CdMTCRbib6KXfZpqmWPlwbmaZ1velvLSlSTGchQx3OlX0HC8HJe3Fei4Q/UzhNuvdSYP
         Yau9+Y1lo8kDgOBA+xK3EQXdcYwdWjTF2WUq2B+bmrgzHAlfckc/2farlFn2AmlUIDt0
         rpuflVcKZdIfpczARtc4ZpgAD7IoWvdVGkP7Gbswp3Elor5Ce+Mi6msHdj7SbGXlvdI2
         hBC8cRASrIflIXxeNs+bapl9aqyajRQeNMVZfwF4vilnoy4+HMRQ6Jay1cjRCZLv0073
         hbjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786459423; x=1787064223;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b8sneHjVqgUcdPxNAhatfJbmM4A537AhZlt95Q+odiA=;
        b=mOLjvkIaVu4I+1vqj9it0X6K4tkZovfwEZTizaoVjlXrBjxZPCMtY2ieTZQgdTk/OR
         Hn5uGi3xp4llcjYGU0o7SLd4gwecmY9bpSiWFQhiva6Fyg143s8BXDWGmhYzVByS55DA
         PmGOLDfekTKAQbzC9TzsGk+xq1dQJsqDHYzKcCULHwC6J3y2CdH07dqgJElJ5anVJiLV
         Sb+zw5MSlqAji8JOamqb8PBbMZYroWyUE8HEonx+Rz/ki1gDyg0k3AMtwN8MDYU4OwMM
         NfcccZKoJ31jVo3HqiuHijfX/kPSrxJXzfVaxra28LbQohS9p3uELpy4hJAmuheNd1iV
         1E7Q==
X-Forwarded-Encrypted: i=1; AHgh+RrMewrBUFrWOuPHGu93nz2Lztt0EPclBjugHUfI+F3NUsuitDId/L5c//G/b/1G/nrrjvOSo/micP4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/MrMTTvVqyAiiXcztj5QXZXZ1kXppHrkitfhu6lo7GKfZxziC
	hW+pjmDNPX++8IlWIJGo1V8lmQuKHT/syx0DkgnduhNOc0VkIwBqr3yxyeDO9k5hi/8=
X-Gm-Gg: AR+sD13Pn+4W9FN0nzDrBm2d0Mdfq/qKD5f2AyDD1958LHvhkAgRm2/xD57Tyj21zrE
	gWjakLGlPjPcxnDaeQtrcXx4M21kJYAlpyNC0Ajdq1tdzhFVLS11rKlSD/GW5cEMn/n5zsSoNgc
	0Dq3wkGF3o0+VYWjUUusKsxBLszNYLc4T9jnZKWVMvxyruXWoWazRcUPm4lZPpPFtAnjIaXx3tp
	3TTWEdKYI7ajjl8AQnQwdknY+0OXa1VqNqot1fxy5HC9r568yckkR749uiY9XcQepNmYUzCxWh4
	qpN26N4t06i6Bas0qeiURtl2EjFgvlIrcDVzUdy9wh/Z5BiohCFZjGDGsuk7JzIdxXUH8sV/Zyv
	YZvY1puy9T9odnMO3HTtvMnlEjyL3UAUPIv0Eiz11QXSi58Ej7D/JljcWECm7gIY411njyCcaY2
	7eHE4BkMuy1pYZoVoiFRAPByKU5zzSrs31khtGbJNAjbuJEuy2BJ85EZG3lqVR+KaK42JoXtdLm
	NtBe1WgQ7qZ6DZiZ/9NVQ3xONBJpHLirsN5tb2wlj0c6sypwAk3
X-Received: by 2002:a05:600c:4f49:b0:499:4892:e84e with SMTP id 5b1f17b1804b1-49978468bcdmr64393085e9.11.1786459423275;
        Tue, 11 Aug 2026 07:43:43 -0700 (PDT)
Received: from localhost (p200300f65f017104853c3975fdcddd6f.dip0.t-ipconnect.de. [2003:f6:5f01:7104:853c:3975:fdcd:dd6f])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-499740dbb03sm74307965e9.8.2026.08.11.07.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 07:43:42 -0700 (PDT)
Date: Tue, 11 Aug 2026 16:43:41 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Vinod Koul <vkoul@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Viresh Kumar <vireshk@kernel.org>
Subject: Re: [PATCH v3 0/2] dmaengine: Use named initializers for arrays of
 pci_device_id
Message-ID: <anszpKGQjQ1zafnc@monoceros>
References: <cover.1784547700.git.u.kleine-koenig@baylibre.com>
 <ansnXXZFP1J_DOdN@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y4h3jquwjyfrrxda"
Content-Disposition: inline
In-Reply-To: <ansnXXZFP1J_DOdN@ashevche-desk.local>


--y4h3jquwjyfrrxda
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 0/2] dmaengine: Use named initializers for arrays of
 pci_device_id
MIME-Version: 1.0

Hello Andy,

On Tue, Aug 11, 2026 at 04:45:01PM +0300, Andy Shevchenko wrote:
> On Mon, Jul 20, 2026 at 02:03:47PM +0200, Uwe Kleine-K=F6nig (The Capable=
 Hub) wrote:
> > the objective of this patch series is to prepare drivers/dma for a
> > change of pci_device_id that requires all users to initialize
> > .driver_data by name. See
> > https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylib=
re.com/
> > for more details. (This is about platform_device_id, but I intend to do
> > that for pci_device_id in the same manner.)
> >=20
> > v2 is available at
> > https://lore.kernel.org/dmaengine/cover.1781161455.git.ukleinek@kernel.=
org
> > .
> >=20
> > Changes since then:
> >=20
> >  - Rebase to current next
> >  - Add review tags by Frank Li and Andy Shevchenko
> >  - Fix commit log to talk about the right device_id type (i.e.
> >    pci_device_id and neither pnp nor platform) (partly found by Sashiko)
> >=20
> > Note that Andy prefers the use of PCI_DEVICE_DATA() over PCI_VDEVICE() +
> > explicit .driver_data because the former is more compact and the
> > follow-up change to struct pci_device_id could be handled in the
> > definition of that macro. I disagree here, as the compactness is bought
> > with quite some magic in the #define once it handles the union, and
> > being explicit (and thus less compact) has its merits, too. Additionally
> > the affected drivers need an adaption anyhow in their probe function,
> > and switching both .probe() and the .id_table in a single patch seems
> > right to me. Because from my POV my subjective opinion is obviously the
> > right one, I didn't follow Andy's request.
>=20
> I think we have not enough understanding regarding implementation. I'm no=
t sure
> how the union will affect the change in the drivers. When each driver is =
going
> to be changed to support whatever pointers you want (CFI) this won't affe=
ct the
> ID table. and hence makes _less_ churn.
>=20
> Do you have a Git repository to show an example of the road map of the ch=
anges
> for, say, one single driver on your choice to see the difference between =
your
> approach and my suggestion?

No, but I think I explained it in enough detail at
https://lore.kernel.org/all/af7yKdRdDSJjkoIk@monoceros/ . If the
description there still provokes open questions, please ask (maybe in
that thread).

Best regards
Uwe

--y4h3jquwjyfrrxda
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmp7NRsACgkQj4D7WH0S
/k5clwf8C5KTtpQjy1fDG4oJwarhuL7OMM+CX8LmrkagAs0soCXmQqPN8ZKOf+4T
fSuxmzl5tM1fnzRRfC/wMRq1m9WM3te/ghXp4w+dJDPhHCwzRmGNuPF832zcY7HR
RB1tBGd527GXdtvoJF/KkWDdMQ1b6iEJLeEGoMf65fWqmZTRMdUmPsNaOjBD6wkb
ZgsQ7JYRSIXYlRnIoKMINTVEYNwuURZJlO6KvRLrULEzLc6zfQDtvhhvuFmQtaxQ
gWA3B/tf9n/6w3RyYZ4/seKX7iA/x+R/H5Z6CDyElybYfVAgz0NsZ4ltCqUHdtNv
iO/NSX9BshsSxURdwanV4Him0Ew5vw==
=nw5d
-----END PGP SIGNATURE-----

--y4h3jquwjyfrrxda--
