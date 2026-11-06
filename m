Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793984257;
	b=QubL6mX50Ys9GFssrS4LBAOORxySYL5bvC4WQs6aM6SCAlldnutm4p0fXVtj3Xh1Nbbd
	 cvMq9/As7YA+K3VTavwn2MUjloCQMZ0MGkTm5KCjI0sAPsn4yimLXWIfYv9ToD9PcuLb8
	 iqhyJX2DgouDtB9FDuO5hYIgaHUQ2Oo7DKAXsFPbZlAE458eT740gdlRlNi4/Bo/+L9Rj
	 6u3KSm+xanXfYXkbeKOqwrlQJSjOWw3rjeDTuj+cTjUZMPDTnTwyjAZ951YC800Q6UCTr
	 QVjRLTjVT344YiiqnOyjxygFbmu8j232p0FGOgyLkM8TVbiZgq5Pc6v4+5Y5mM9Ir+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793984257;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Dui2HnVpfjzkzxu9M35L+PlJD8C9n4WzI7XNWWzwiiw=;
	b=QW/whkO7Idqp3r8pTwuZCPzaLQekXcafcHitNfayOiCmSZesM6ZSoLLZmk7wgazGnZOc
	 8gr2N8JjekvYj+h2uXsAGUGj2/z/UakHLuQtkUcDPKfCHWx7ek/tAnYc03O7EFrsXKrkw
	 Sn1UwJu8AtDqCptLgaBCcXZwR88XEogxcHsJqIAuBO5cB9et19m5626iUerfGaggghhoa
	 uN2Rt7NTaYHgHIZLEe8SAFzeC4MMV8k4wejXnbDK4Jp3t1SNSosVaAYdQ5kQ+IvZUOhnb
	 SkJTsw/2A/T5SXFJQmFfApmfvFp6gsUal/X1fsodxfFkhQs/BkuEqdb90uFysVxchUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=JOFE8Euv;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C497606A33C
	for <dmaengine@vger.kernel.org>; Fri,  6 Nov 2026 16:57:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C497606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=JOFE8Euv
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4b7252a32c8so7539205e9.0
        for <dmaengine@vger.kernel.org>; Fri, 06 Nov 2026 08:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793984255; x=1794589055; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dui2HnVpfjzkzxu9M35L+PlJD8C9n4WzI7XNWWzwiiw=;
        b=JOFE8EuvP/aiaExAz3zhbWKSmdofbIo2gyAi15JmBQowqrHdneLciitNKgOd/Rc1MY
         TqlwQ0qZ6+zprLi8oRzpeZdfT9rm4Gk/2vmpzUyY+WYVrFq/4VnGWu0F92eSYknQ9eca
         irv+2yYK4tyLv49lJoGUX8YQNNFvczC/QXgxtd5OBkAnr7myUkbuqiIoV2K3p4F1obdH
         Hit0fyb+jSGiSyYi6k7b2PCp0Nplky8lQRcW62b9a1jHv9+1r6ph2IuIoqmuX0KV/xai
         49KfI4QeYxnwjMZnTkPOQWP+BsrShNRyaJdZxDrxjQM18awoxYdnpxd7/h6wjQeogqtO
         LtZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793984255; x=1794589055;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dui2HnVpfjzkzxu9M35L+PlJD8C9n4WzI7XNWWzwiiw=;
        b=PnTRq1HPYh1LohGMmyuBExipByZ3dLTz5p28oY0cLPUGMV1ADUQPnteexQ0kQKVc3y
         N+DYc6FPRsmRyf3iO5QXe/fSkwGKIyFzDv3LIeLAxDk9Z7gopkqb4OOmh53RQH35Baza
         Ncoq042d+tgQOYJIGPMiFKTlMrIMx0TLipDzIEy+/0mVTK038yJA1NtbxMyuwqDcBfJm
         yMEML4Zsx1PXo4ACE04UGJ8Ti0XIxPf9tymipP4oTAyf9I4DgZ+NAkmga1pEzlaCQRvb
         LFOT7gvOQsDTEwpcT2axuFiBGM4T/OO+51Hl7teQk4kSU7wgDTlKCe1oGTmU6qvuePKW
         1T2w==
X-Forwarded-Encrypted: i=1; AKwUvByRwSrNz+4hxcwa7dKKfRb5b4/dFSLuNyns/oJzGAd4ATOMf4fYG5iJ8wVnopTmmu1Hy/n4xT9z+HE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XwT2a/V3GhEKgbLuBBwpBeFZvqO18k/OScyKAMckM6GhYUrL2
	CiKG3DsTSvztg5SdPWzPBVaOB21LUbW4TIt4b2CkmEswLhvsp1E69OOLtyB3Hrkaoi0=
X-Gm-Gg: AYBFou13izKGXe3w6zBeXSUVVsC/hEfVlvdJ3HLMe+fiXfwazAe93CV4sIlLKDJZQAo
	A9PdDHA5uHNUQfVstienAwrBukkhvALETNZnyUleTXGePzN5B9ZN5aRBiWhnjEdqhmDqEdKWnHc
	CR23YQ9gP8GW65tZgvsfP5fPdH1e37llAzGoOhaxrnCBx3k/AWIH5+6j5YVElGumjr7+lub62XR
	26fqQYmtbfPK2aSvY12rtxqFjcNyxkyp8+/f7l7YqU6fcD6JheMO1vNiXOn1gkUKVPdFPBSj3LB
	lrJyC883an3hAolH4lDJsKTCF1jOKHU+2q/pwdoMeqcsKMt1ah6gCufkkZxZIP6fo+xcDhAc8Oe
	qgMtMb1ei/bgjq1c6F5IpCVX9arU5Zyfsb6AF99eN6MRNBCnttBje6KgbtaT36Q08gnvs5Jg4KX
	DUhXYTX0rPmJZX+rsuLmAe/wKbkn+C3ZCmzNZByzxA/aVSuYgd7RVxDYM/E4fnuofrkXGeu1kVO
	1Yvmuf0Br8BEWUvwjm5rIJgx9nh91j31u97wfpwvhHNzZwJP2O3rKpJNc69VZjrqfdcaSNN5NSV
	5hygDNTHLjTNOlJM6mGfN2zKJDlaUP9R
X-Received: by 2002:a05:600c:a013:b0:4a1:c6fd:4db0 with SMTP id 5b1f17b1804b1-4b6df5eabebmr51738615e9.19.1793984254955;
        Fri, 06 Nov 2026 08:57:34 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4b571f46538sm144730095e9.5.2026.11.06.08.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:57:34 -0800 (PST)
Date: Fri, 6 Nov 2026 17:57:32 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Shan-Chun Hung <shanchun1218@gmail.com>
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, vkoul@kernel.org, 
	Frank.Li@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	kees@kernel.org, gustavoars@kernel.org, linux-arm-kernel@lists.infradead.org, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH 2/2] dmaengine: ma35d1-pdma: Add MA35D1 PDMA driver
Message-ID: <au4GkvPTXmcvReoj@monoceros>
References: <20261103022202.2139674-1-shanchun1218@gmail.com>
 <20261103022202.2139674-3-shanchun1218@gmail.com>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xgc4symavcbtq745"
Content-Disposition: inline
In-Reply-To: <20261103022202.2139674-3-shanchun1218@gmail.com>


--xgc4symavcbtq745
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/2] dmaengine: ma35d1-pdma: Add MA35D1 PDMA driver
MIME-Version: 1.0

Hello,

On Tue, Nov 03, 2026 at 10:22:02AM +0800, Shan-Chun Hung wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't use <linux/mod_devicetable.h>. <linux/platform_device.h> is
good enough to provide of_device_id already. If you insist on full iwyu,
please use <linux/device-id/of.h> instead.

Best regards
Uwe

--xgc4symavcbtq745
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmruBvIACgkQj4D7WH0S
/k7itAf+LYAMF4hi693tZ3vEcl9qdHQIjdqKde20tlG9djgG8wsFu0VZ/opYIUir
Ba2Ft+nXyZ+omHvukP/oarePmgmCz7dlRmpi6tKOAV+werJYpdagvT2ZHxjF2/eU
SRq3hKVqHZVh/RS7hfRwxcPjy41xhU8PPT9ijH9syFoVtOUYbKKLjzdGTFdq0VNm
TeXK1teYk1wcOc1zWnVsLIdMk2DtMOGpFMisNxIvSXPHr8CPqfQh3ZhDwVLC6WpK
Jo3OwmvckiCe8ewY1FX7j/uIvM0c69sIBKKFnHgagXSTXFfhUgxYs4I/UgegsndF
7ViQI0kKjp36E6n5RxerITZ5eDHGng==
=zoc2
-----END PGP SIGNATURE-----

--xgc4symavcbtq745--
