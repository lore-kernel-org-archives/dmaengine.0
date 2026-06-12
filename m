Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3ACB3DBD41
	for <dmaengine@vger.kernel.org>; Fri, 12 Jun 2026 07:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781248231; cv=none; b=slt7UCrvgoBLIUgD9CVbyoI+eFKYgXfmL30NtnvHpKi2Bl/hEgKqlQPUEaH5cE4qfPoIw4ubbHHycUCBWuIfoRnAEGLu18E7ux9FiMXbVi3beGmuOUuXJ12d2BPxt9tc3DnXY+K4XWakO5QYH6fZpyAJ1fVAede+hQLT4xGchug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781248231; c=relaxed/simple;
	bh=ZygED/TgcSaqbUiAwx8S4bYpGHo6x10dsCPWD/CLMT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i0Y5ZokS65STFw/YffpLvGxC+nYhVV6hs5iQo6TJ+W7sPWa18TjKC0vxM/DVXKMrb1X3du5js15ylOB6JmKSgr2LnrE8mb83xRyKlXZ6WlepKjcK4bodDKc1X1YcwILKj4Pw4Znv8uhT553To3bwfhreRF9M11VY7XD0A1dUFEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=bGIwMaEc; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="bGIwMaEc"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490b9318997so4406665e9.2
        for <dmaengine@vger.kernel.org>; Fri, 12 Jun 2026 00:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781248223; x=1781853023; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZygED/TgcSaqbUiAwx8S4bYpGHo6x10dsCPWD/CLMT4=;
        b=bGIwMaEc64sYxoR/dnhPdDeiLPos2ijIfyoPV9D6sCOyWbh6M+VHQdzPAi5mZVXVJM
         2N8q54bgYOmx+W2NkF7g2UCj3c3Lzf2YQZksNdOS0oiCdoyAugsm6npVcoH2uckIOhfX
         rJJsWhCb2G7NGT7gIh7fNBJ4RhW0xA5LYc78CEa0ClllRv0DI3rGB/6DpeLoLYBa8Fpz
         xEpCm2V7PdNVtOoPI1TFtJsu5glayea8z/U/emYpgizdpd1n7WlOQmiCfYDRxan6vOwD
         EE5jVSgwqpQ6ljTff2gVdhF9CZnypAXIIY1owPesL51Hbh3heIBSd4qi1dtLLzJqdj2D
         I7kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781248223; x=1781853023;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZygED/TgcSaqbUiAwx8S4bYpGHo6x10dsCPWD/CLMT4=;
        b=bRGN24otZhZzF5sIIHP2WJU4vxkd/oix0wCeGL6BYaLzKWKLm4PaNvmxp3ZFy9fLnI
         n7eH6Y/GvIlpqzE19+NpL1gnI/PMxg8sINjNX/u2sIK/mU1PNF5RfUBomRdkUoFld7nV
         gIqF0zOaV/MTkVEd30AKabMKpxRDWoQqPbzsjsSrLxnPU9jXnawY6ZWKC9LRRq3nVkyq
         x0hpgCFb1mTnzSi+Miuf+O6mza6jujuee2yiFi0gvWQvSe4ndJuIeX692g4fDTNLUxmR
         QGWnCZD4r7FGX9HaZePOuFCf8tgZwHpYxd9f6Ppd+N5hc8E1FGoZNKq34Ce0v4HA5TPq
         t3YQ==
X-Gm-Message-State: AOJu0YxrnVrOaloP4EzXBhIrE6zYLUjWjpbecwR3+0vXxJrwLgr25vPV
	c3kKL2W3wAtoWh9jyPy39DVbq/sJq11o8U2R44VN2NH7Q2+x/qF5vGJyYL1eXMMsy2oldgCxhuV
	/qIAj
X-Gm-Gg: Acq92OGKLf2rKONGrySl4feaGxGe1KyrrGP8TahymkUJmyif7Olkw2iB9fKwFGnBh27
	iOmfpUWwhOiY5h1d6a4Fwb+WkG/d31fg2IOFuOpM4TrG0B3sGoItc7K23HG9GI08gJhGaWBTAgD
	jZ0L2g0CPhdTWDfkQt8IXXa2z2X+Igu2cctZedn1Zh0Lp/Wjrg8me41GL8yfHJl2k12UDv9/912
	FpNeJhSJrzokYLmgpprS5KeNeMYWuY9/aS3Ri5ZlIv+SxYTiM+1pH9ZTDwdyxihDNXVwsWu/ylQ
	m2BPinIEB0P6UEZwxY9bzx4f1hdo71zFqsjworETm43DhV+uSY3noezUyoQbGshgckyG5VkZKlj
	QpJ6rErS8bSPXMYbtOl3CtV/qvTHWOzMKI5lcW1OJJdOv3y5eknOfg0LYE/3d1NxIZt9caNy/cZ
	B9up0hdJTFG3DzUS7rnxMnn/y5OJTzrroznAEjuiKY+gEUCijmuNVuAu7565sIoGqbs4sNZ562r
	AI9Zc8GUVOLzmwTcqsR1PN+
X-Received: by 2002:a05:600c:83ce:b0:490:e18f:d112 with SMTP id 5b1f17b1804b1-490ec4df0b4mr15052315e9.21.1781248223452;
        Fri, 12 Jun 2026 00:10:23 -0700 (PDT)
Received: from localhost (p200300f65f47db040e4e5c1e98e7f0ff.dip0.t-ipconnect.de. [2003:f6:5f47:db04:e4e:5c1e:98e7:f0ff])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-490e2c7ead0sm139245145e9.3.2026.06.12.00.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 00:10:22 -0700 (PDT)
Date: Fri, 12 Jun 2026 09:10:21 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: vkoul@kernel.org, Frank.Li@kernel.org
Cc: dmaengine@vger.kernel.org, sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v2 1/2] dmaengine: hsu: Drop unused platform driver data
Message-ID: <aiuwi9amtiyoppxZ@monoceros>
References: <86a23025da12369034dc7444f43a7763f2e515fb.1781161455.git.ukleinek@kernel.org>
 <20260611081105.863831F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v6zxtse6fli25xdv"
Content-Disposition: inline
In-Reply-To: <20260611081105.863831F00893@smtp.kernel.org>


--v6zxtse6fli25xdv
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/2] dmaengine: hsu: Drop unused platform driver data
MIME-Version: 1.0

Hello,

On Thu, Jun 11, 2026 at 08:11:05AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] The commit message incorrectly states that it modifies struct pnp=
_device_id instead of struct pci_device_id.
> --
>=20
> commit 5cb66572eea17e218716d84ce22cd0b73ee38c30
> Author: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@baylibre.co=
m>
>=20
> dmaengine: hsu: Drop unused platform driver data
>=20
> This patch drops the unused .driver_data assignments from the
> hsu_pci_id_table array. It only modifies the source code representation
> and does not affect the compiled output.
>=20
> > The driver explicitly sets the .driver_data member of struct
> > pnp_device_id to zero without relying on that value. Drop these unused
> > assignments.
>=20
> [Severity: Low]
> This isn't a bug, but the commit message states that the driver sets the
> member of struct pnp_device_id, while the patch actually modifies an
> array of struct pci_device_id in drivers/dma/hsu/pci.c. Should the
> commit message be updated to reference the correct struct?

Should I resent for that? If now, doing s/pnp/pci/ on the commit log
whan applying would be great.

Best regards
Uwe

--v6zxtse6fli25xdv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmorsNEACgkQj4D7WH0S
/k5VTggAnQMbpuIjjXuyeTA+SehAUaSHYsiNRBA74BCHsQQf02RPbJtTmJUywI7g
XCQmC1+9M3o8qP3dCC+2Ii/S1grqPyuKllQclUy0zUIcWhiKZXKC/ULhALI4jVyo
c2WwptI/ghLVLmjfIO4WgY1CNHFqKG5AjJO/GQaLmACTTh3xKM6+z+pDa9ZxxzFW
B/8hWOAiiDvrqnRaehBmGcHTIAQQmauZDZglL9CXCEYkyPlrn/ywHyTgPvxu1xgh
1haly4K1LDxHlOataGDX36KPMhHXEmlZcqfWj0Vt57ysTILEMYcmtHHmdLsYhbkp
re16aIueLFbBwAXB56A2yIeyoUl+hQ==
=Ldv9
-----END PGP SIGNATURE-----

--v6zxtse6fli25xdv--
