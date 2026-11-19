Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795104442;
	b=4i+LBAoI5K3kisAWXamo0aQprVDY9dW0tikjkSPkq46s+CgDtqk9ZuvBgjiG/sLcpy4u
	 rKTvImyiZFI7LeTu2WRhOPN3+j0QKee/HnVg9FwDO1n9QlUKq08+MZ8ZvsNx9RzrUPH66
	 il+unNQTbBMymHLUxidbyNAFxYIunhdcA1UsEx8j2JyaQU0JFFVDqTZV4OE3WVKYg3+pG
	 3g9FMzo+4RPImqhoUfPngMorzfJlQQFAebgE3LJRuY4ZMgJXJIQfFvlUB95KM8dhr+ZIs
	 WWI9mnZY9PmzU29D+ZcHdDJw3PTr5+CvRQniqI8XMkB+X0J3tGpPPw4JNX4LhpluW1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104442;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Content-Language:Cc:From:Subject:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=/wnL1UvT/c5ilPHDxkdMnGwn3CKOu+6AonHzFxLDRf8=;
	b=eZGgTZz18DL5/nxLQr8iykg8q+dokBfvp2vVT9lktBtICz/IM8JLSbQHlfLw88pfZbDm
	 6NpJ4fl8edAmV3zxR1S8aR4vdsgt7elGFHmYT83ZVh7vxa7R4R+AaAcwUJ9YoXBTM0UMW
	 M6zi6gZpC0FdcWQIX6HEFwLnSUF/Q4q+iUuHAhjuBtCVcAXBBiA9XCY19nmZnPDZg6EKF
	 tpHQdgZAmHC/yGLzRVonjrR1WrzzmSQNPqfvscXcSjn57nZidqdhm5pdpBjRsPpN+04r5
	 OqrS/+6RodVeq9ayshKdoG1K3vxtuyPQvBZMi0DTYild1Y83QsMP73BLJVjJtWXei1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=m9dBRZBQ;
	arc=none smtp.remote-ip=212.227.15.4
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D62B606A320
	for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 16:07:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D62B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=m9dBRZBQ
DKIM2-Signature:  i=1; m=1; t=1795104438;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGRtYWVuZ2luZUB2Z2VyLmtlcm5lbC5vcmc+;
 d=web.de;
 s=s29768273:rsa-sha256:OxX1lVzEMwpwZw2gNrsStNE5t5Sg
   9dFlEl61O5RxIUqcW9jout0j8xKPeBycJ64LWxkA15yXA8U/nIe9cW60jPdOrO6BBVYxOM3es3u
   IOJtkbADbvBg+XoEvalqWx0sZLK/AQ8E9pOfYKRbFD/t+4jb6vXvxhjza+/2qIq4h4KpMoCPWAo
   Iz6zfedNQ3sDDohnb2caRMVK2SPCILr5858glCWeE1cjGakW7daxlUlj5XFZwLq0X2b1V3jWzSN
   IU+pm2Xtcta4z2DPqcDMc//k14Mtclz4Nw5fprlAkbppz2uCUKaHhYKC2/7DQXGB0XNjkQ8uRaS
   0T0XfRqNVCAU8w==;
Message-Instance:  m=1;
 h=sha256:
   4NA5EgNuMb+sfTmVMn97B6jS1f2GOvLK+VCYIZwTgIY=:
   evFYYfp8jgq91t3pw7ed/FtR++zjbtU9bCpzNYcqtA0=,
  sha512:
   m1AnSSDu9TUSvI3PV9OBwU9f5/C25Gz7yUK2PRq+u9E1ZiyMcN9xgSGMUIkZ+L+7z3OF4IJrQEp+r0FZM/SCpg==:
   NsihE+x9Fh7+oMyjkaCmoxstIdWKgcZe1GiII7jSZlVG9O/u9v9pb+VedDyU1VLrcgbPB1dIqCZacnH1koRezA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1795104418; x=1795709218; i=markus.elfring@web.de;
	bh=/wnL1UvT/c5ilPHDxkdMnGwn3CKOu+6AonHzFxLDRf8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=m9dBRZBQQnkL8eBrEMALbE6YqQDDqBPeI9ux0eJlM6Mc9jfh7uPyA4R834wGTcW3
	 bh+Z87IwP0C3LuO1Ik3TRSZ90wF1VSDr/R0tJqZFp/SqMscQyp6OZFr23fF9NMtRO
	 mNnC9Zj5kqieS6ivvsP85V78jol0DVq5gw2uCFDg4hNfkdG4sY0oPkXHiByRORuXj
	 fQ7ZNBZ5KKPd912GMpFkL1A4RT391c6nWikeH2H/E+mK/nZC8PFHID+Gu+Q12PC9I
	 9OAmaBIJMA7zIbyVmxagYACWFxvg+3nvZZ+okYnvvYKd+7nRUCVDVhilTaDBgGS/x
	 6uXw2x28z0z/AhMbsQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MNwfU-1x5v2o16wy-00RwKK; Thu, 19
 Nov 2026 17:06:58 +0100
Message-ID: <8e3534b7-ae64-4c1f-819d-0ba390737b84@web.de>
Date: Thu, 19 Nov 2026 17:06:55 +0100
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
To: dmaengine@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Frank Li <Frank.Li@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] dmaengine: dw: Use devm_clk_get_optional_enabled() in
 dw_probe()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nGfRIaTkoUhznl9N0C+yDgyzCWk1ZlbhmeG82LwP7r3GgfR9MHX
 T17teyOACHi3eTkahXk46pNmPY4fHmWdOq7Axt3/9UucEQQ68fMDpOkCL5AjF6t6Cyt2h4m
 1iUZuA/RXQoA3L+lnl4l2IxURpCqJpSxUgNiZn6/etwPW7/uUzPCjVZYLgqbrrHNSAObdj3
 i7gpWC2EHFFfxh6shudVQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:TZ93wwrAqKs=;C5V3WgPAd8sxio2xP0Fsjpy5tO/
 1u1z+6V3Ix+eoOfSaNjz9qla1kMDVE80CEOVm5mvmxicfSJGpSAQFBO5ABSByW558vkAcoy8W
 2ZPqUlAwVbsfJkAYcED72ifKFQwVFfaVd+9sDTGAwSeNUBbrs9tMw/KVEGjYL5aoyx2S4kOeu
 14a2BMyv+UGZSY7K7dri0nuHxZicabqqfTT336XvST2vZGl3PYtLa94BlcbNty1wWbYaV6Y8t
 S3+D3/AqOT9e9p9ZvZVA6F2GwjHB9tJLu9zNfo8D9Kk0U6rKxv1Wpq6NnphrDBZgaJrNTWMN9
 64W5mXauzd5aY90DPdkVeYK8zGUv8glnSufyVIhsMLGvpe2TsKKry1kPTOJq9npzSL1NPnJGK
 6Kqp+3QVYHYBMH6NpKaNhBSt7zRpGjhNYMbn+x1gOJZu631espIgXDMoi8G6HLqcg2nZzlwGP
 NIm0fEG5XW1IQ1B+HQSW5oPZItwsm5Z/f+AmCNevzDdB2HAx7gGS2CdDSQ3zSVUSYDq291Lox
 /wC/SmTltzH99vWT7EOfPOVzfiBwdnfkH8Vcd8Z0ktT8AkVYa5YDqRNPdenS7Qc8bxPsDuBPU
 ra+e4gB0mIo3f78OxxjmKzYy4H/Z01nsRVKEjXA/1ptVlZ2A1YBkebbhQhVNUuPA4ArMx092r
 iUzxoZyWTIFMxkbbfHZUTo5lnihxBcS7zLtUSO1GygfGwEWHAG8n5WmzWSGXmoiHZbbKdlW7d
 xXYHkGxUe3pdgKsGa/Reony82yQFCBkaBi6IdA1MdjGJRs0frcJBGPJFD9cqspL9Mx6NQzr8P
 Fy+LX/9SNJwIkt+45mgDr0ebLStzrCNvNea2Hxf8asz3jtMvTMvrlpq9fj2D8ySw2wp5MOhZ/
 O085Kblt4pn+TJ207H6lhgAoL8wMZCFIfosytIeOqEJQxjM3Qr4hW65w49anhnc8ofupFnpeS
 ZvzUSpQ997DXTA0KCFIKcPmcc07OS2h23ZysscP4egzNDJGML1cOAWp4n+3FC24ptWWfWXxcj
 p4/KcCwcCx0ZKAmowN49TpOJpl1nfLLK4gCyjTFk0+3BPpNxvgymnBzCG81R5PukDKHgfc2si
 agS4zQMWO3D4CXvSOpMyTrw1EyZiTIcCRruGayxfGMoyUmYa/WgKOEbnodtoe9c5Ly1b3Rfrt
 Egt8BBS8nTtaPsYnQ2viojkJUHDE0F82f0dMoBt7+8eL5Nijw73SZjmwasKXEXj0thMOpJHSw
 E4cz/nSKK3Z8cYJfpRWqIajaafFlH2PzT4ItJmHdfEDxPC/gZPcNIEUL4iFGwIZDK/bk3yPki
 LdWeS8E36UBAIMLRf6AmhkNemVAsduQEbtABJPZ7hanTlDQb1MqThBq2t77K44jQkNsdbgBPk
 X215FX9Id9xkDS1Xs/uZw9vNW5lE+pjufq3QuRzFD+5zPkjzuNJBn7w0Mlj1ZuDtBGxvHn7i1
 xp4o452teF66GHJ9DZ9C1nC+9DkOFl5PcTYEFoQSp4RvhshovTgT0NKFrciXTtgmHqhQnVUwY
 rrB7R/5q/vUXK9ZWIMoWCyGMSRbdsvfXBF2k1HP/vt5LD1mkdvXW2b7j6oElZUqUCeEMdyM8G
 JcKLrJqpzsB3IMfcT6aok90hNBqSKD2lvn9pfeh6uePNmRW/divYeujgh1QQILGF9G9/VO8tn
 p+sHWtNFa0VNUBL2np+sdp47Jhra+pXxxBjDYy0mWy/iVsowz5QbpyuGFQd5lZ6ignMbe/j1A
 3/2Z8cF9v8iyTMgVxoa4U28uQQrZY/t1su8oMWmaT0Afr2xuGSxPGnnVQ759JW+yuPDj/jOKh
 jEeWIw9rBzs0C/xzcHszpqZWEfqn/qJNj8+BR/XS0hUCly0972jISN3QjdRRGv8XMla3XOXy5
 7G1Om2ccJd4Hn+nJBH7T3s/B0IACO7HcexAoJLou2ccIzfGPfIspYJJaQClG6bcANUu+WCZkv
 l1yF+GBdMPBxPyVFaVW5y0bHbOcQxpMI58DEeiSpWSIWS65CxEaD9SMEyPx+fU6rkRF3mXPw+
 Vyidw785fhWCOo2ZCvGj4fUk0YDZOjP0irtmN0F3j2nHquEBQWXAsyuVeAulNUKXRJ28ORHvw
 5jO4lksRivZ2bI9iph/IdKYP0uChkLYi03DCcciQfGyU+Mo1fu8e3vXcJdFtCcq31Z8qs9I6X
 bMi45T3gVvZii2wLk9YmduTOc96ioad6GKczFUMxywYG1CIAKNsKtvZBbdcRsP8BGhsPkSsgW
 iVjORYVNQOcfBnsdnbYSskE0IgKSK7KvTZ24gYMesFz9OE755lYBP3rVdnyBSaaBSyeWRwk4I
 Tn9t4lQHL1amYzbEX9WOHm48qnZcJXFVe4fpTFZpXeANuMYDiZvcJ9oJDnZGhuT4+YLkE7mSo
 7v71RCjt89hlCNvZXC/3BC4O6Ly8XIQUz+Ym3vByQhp5E5GfHSrBHaKHvNr+LrWRqOsX6vNR8
 skwdUfZjgQ3o6zZKZP4c7A3ps/9f0sCiSx7WpMp910g2AHc6SnUlGg3Xadt8Yb/dqdcrNAHm6
 jWbimwJQHAxuZTVloIztSsxSbkYERHYb40U9EQ6/RUVhfQCcRj83Ia+TtkP6fgdmITx82HdxU
 ksVOk2GhwdAQUDLxTa0HueGu23ry35BhKvVnS51lZpfekqObF30R5y8/8eWYA9KK2D3pLjNvy
 PkchPO2kIIPVeZw1qkU7Uiq/ks7RfkSHx4tNZAJi2tFskhCdKCOcCvmPEYEoGNAPoyubQu1XR
 WlLOzQTabe5AB4gWRY/evMwCp11TGQlZ+S7z6BOQNQU5Kfx+D7ZSRsxpyoJLhR4wO+6rvmGxm
 OSdkKSdbk9IIP37Ik6Sf+s4jVvsnMJ6ZB39zum9GQoCpN06GjdGzhxjb18pKu5bGr9sEKnKcw
 e7pVGvEeyoOh6FKwGoP6iy6hJmBOU3MYUS4W6x951ew2iJ863vCP8yu6XTTrtinhuIPW745uV
 wVu6pKYPr8IbJZCJq8bgTxt/jlKru2KrOSrcpJnx4HnmBtuTM23UR+IaMaGZmpYr7jvRUtZoW
 tHpWHYfRuBYOS/tuLk/EsdYDmHIfU5qVvzA1I5SyqvSSOucCCetfxbuCcpRr0UoOxqCugPPfy
 FzDsEcU2UklgcN82l/56TGMjKisGo6ujQuk2+bfSaofgGjEDnOm25ogUK0tHljOdF+vV8TRc6
 Ub2Y6CwkIw6WTEFXNxQPv6x8TZ7hvCaaKCfGAsIO7+Y1U3rbW1y7tnGFjwtEo+BzeCEEQrN67
 aac+Y/serz8pTWpjYgHKxoqYWSt93uef6z74akXKNniZYiINd+aisxo6yTt3H8L4sbhW8lRUi
 c2JmaFoJ4mr6XSuf4KfNfL/ZE4YohykuKWXMnbCzWLZlAGghrYbMNJ767+Dm9pmGftSa5npar
 FLD0XjjUAPDXRlDmf7Kb87DMjVSD2iueyy6aI1vYqR6W39368zJBzfqW32U6N6TPqw1EcYloz
 4t/plUOpKrwyH4Em+DKeO19R7LpDmDI69pK/TcuKNHQt4I0SLIAAc5OGmrMlutjTl9VjS4+fr
 wee02gr4f8RFSPqxvAzrA5osRgv3ILXYhKkPG3swMoDJsSZShg7dfKxvsnX87kGzL6zsWVjUz
 a1nYMqxs/UFC0o19lVgqgREOXh2q/CJd4IUWnFgXmnoHMxpNSAVflV6xUbj/jVSonIKrHDkUW
 OtCdwYrmf6UUjQoAY2tMb3UfjC6eVpS+/bYfd6Zo1mKJMydUfLnuy8xpr6KVOQuLZhhJELJk5
 I2/cQc5iKukN/tnUIWwNf0Ex2VBC4l5VPu4IYz7kAcXPX29W932d8o2AEHvnnUTGybGxUgN/G
 mReaG2nPiH6EBhoaPXCx06b+wuNck83PL7ex4KNYvmdCrRIpOnaVZ/dYzHpmMYOn9hfJUoKyX
 o1f6Nj7r2Y/eN8gaIPDhadv+RlO4ne9gQTEmy3O0gYHtV9MEDdLaKMtXTTIe3J9SCI8w2k6iY
 /0shyOek46bd1vfKwm7P+C+zPaqvbgOlGQPvaE/ppVJHKc2OuVuV4wpSW3o/ajaCNUI3SK60k
 AM9AQpAjci3jUGXb2dF7NxNnGoHYe+o6rwiODiHCtYZnHNCeEFCFwHbUPFj2KAEGueaDaZ5ru
 +oPIEdRFaNywdBKs8BC5j3gubJOLWTPS7I9OdPrI2KZQx/VZ5ZuFDj0yieYHDP5T0vuAf6yoE
 L6QbJ4xg2CmU981U8m5reW80ul8WkSgo9c4sy51N1xgisNhqnX6cDF2bmxlriVvXyYbYxfCix
 3whxEDn6IzH5sHVQe0H2ZRvpPFMIvrO1XME61Kcl5IZgLrIwDGt2RHLG86B5VZqAqG4tf+imn
 b/0ysz6XqAUZXekLMXASvI3gTU57hmJmfGDFNrdTRCRqAYp823RHQwwOFhWXwpeIoUsEkaVfM
 dhwseZsNSjt5TNVNnTUijG/2pf3iErApd/y4NVcmC7Z6obI/h+L6t/lVQ1zE21p4NildwIAZ2
 gVnoYyfHVX5YINPCJEXicRPpZqPPn1qGfmVv34m/Nb5Ur6reQX7eJFtKLV8d/z7DycVyI9kpc
 BQAEsFFIfZJvZaZoOEDZaGgO9a5lLX2ic4D9s/CB+8pBcpCF7ggxE0m4zgKU4Pz7x32j/lId9
 p75xPeOpLKZLqma3+/oTKbuxTBuHUYOw7QgYF2r4Xn+cKUeTGWTR9m1GN0xRV8acNSZiaQOXr
 dg02bPgJjTJ9bsu/K1YqF4rYSQE3VVGgGCNVYVIeTRpepovUemI+hyamdhj27T/E8xp8SKRn0
 tpcs5XKwmVom8Y8oNPUgxSGDzFwmBCba/JIoAxePMKdM6KYIEd8Gatj9zE7IOTAesWcZCLXjk
 dRl9U7cBD7cTSV5JBbSpicD3zSRuTjEwWhT5ikroh6bFGzG0qLVl+g85DkEbdhfIJ+f6o/FPM
 KS8z2GkEfSE/oY0s+vKM2ht/d9ekpGSiXvgrSphVOU0AIFzBzYdgKKl2E9UgIJoH23Isdghd+
 sO317ztVvV52fBvKPIAF6bFxZJ669IHtqPA49qIF/bozvFWGmufE5CVll6y5oKed8x69ttFZZ
 LMEGDQ57hhmCQCr9nbOBAZor1I9WZ0LqHkdGbdskHKPMUAuEKe6pGJHHKLauBJi+uJJCk3KSn
 JdtjjwkWndcQ5L95nuKe26EasODoYEq4jqvDTa0yhbgfLQE+Ed4236uSIBUcBSAHe5fRw79i0
 ma84LUjmD0DjfxutXlNalYmBRjhKST4rz+58aRwmhW4B3oXgAQVMCeU6g5N1OIXuXe6MNfcSb
 kFoLHLuKRZVu9Ri0LLqq+L37VDM5o3uJiTXxEkIqNodbqhlVO2HfNGjtO8AcKRjixrk/SxQKj
 RLzKJun4dRs48PegwJr7WP5AVbXkWllYRclfYrh1G9S6jVhBUTh/6a3MJo7nctfilNV0lZ9aN
 YAgYJkZpKmFh/sLsxkLTxxFC2X9InhUmhJtG11qqZRsuENDN8EkvnbvWar+xrRdaoZTahgPC+
 YkrwDt7zFVJR5M5zoew6Sh1Vo4Ytb94wCLwsR6+tq0Q26NTycRmC4kg3KvwAfPMHWWxfp9PU0
 AL3GcuzeJ+i9lumGFPVBLuuN46uj3dWLnhHVOt7dxBsuYrNMSQ50unluqM5puQdbSn5Ltncqa
 qOtsax7Y8twmFJCMTq8FqAkli7PbyucmxL94EpT+Mt9S9QRdpxIGn17Hlw/93kKVtK3QICKKq
 EFuwKrMxDkSG5ejCbeW/x/2W5pEbgV4iE+Aw5S3uD+jGH8liwvTzlQdopPdzYXEpMYD9T3V7i
 S9fxRdLwfj+HokrzaJ2Aap0LAvnWT1H4XOSI8hIfdNHgRbjRgMOmbgha0Y0t9nArMjHFDhtbN
 v8jbBe1PRq0aJeotVBH+OKlUOKw0BLgN9aKbgz4YU0rYic4G8GxI1e0HUiwLT+q22QU6sWcVQ
 kuTyngZZYf5SnsJZL+zBDATSdLbUQ22N+a0Y2eXQA6zqpa4n4j9Lf0p+OtLlEyNJ6GbeITtSy
 oAGZc96NKeOZqWV2hy/MwtCNTMHO/ScHfYiQhT9EoyD0XSrM2dcCISnPOgmqfAbz0uGLTS3Ez
 IdseGWN0kw0xIJqVxyl6EgPJIRRSuu3Np3nUl2nyMphcnk9mitbMXkcXIEobJ3JVtk9s8kVH2
 AVJR/YpAE177MNgxtAhXwVrH4D+O8mD7J1EPAEDZjzk28kGam5gEXepGv7/65cfJ5yVY6AF3g
 Z3SwboH0FJjOt18N3gqsL0ku1EAFXLbpWJ8D7Qo0j8jVbGfNBaiiMCjCat1BQ14O6efsyZxaO
 H0maTWEmVlW+V8n+dNlhJFROykXeMEchvTjfG0xWIG1TX7ZXPWllkt3+0kcn5Jik0osEcKK7s
 E0vaeu9oBLBX84834FEQZilI1VpzvJzEegpJ8jWwpgUWx0EuT7pEiHBWhejhm6+tiFvACGW9R
 K/vtcisHrpaQBBXJuWEzXx6P4lA7pXGW3nAd34lIHYZFiljBBtXII5EVAu6VoU0qsDTWvthGY
 R0Tc5kF5sr2kBtZWmM4jIPe0nU3O8G5mrFBH0oV29ZuQs+kZgWzkDNWakrKlUEZI1NoiOBW/+
 +wSvPotDWgNkZj/t2XOJVVOAheLUtnpaR9qOTgFOCrugqwr76CeDttoHKzQMFSOOvIFg52tZC
 7UxQeXtrA2jhlfsmxDFZDmohzliUuqgdNtX/hqq2OigFw43bXw2SiCQQleEdxrZdoOiHt/lT0
 4d63hw8XrON6ut6ttCcp6M+tmDORH5Ga/DBgSEjlbesxwBGcovY/LLR0GTDtu40OQBbbO36ZI
 Arr5YJTcPVGsp/uWquYdBmSdxpxg7wTdN24njjk6U6E3qvs2W499S5f/T1vgfvXhKllurNIAJ
 yS/49sVkWzORyMMue5ag+pcWLUy3g+O6bm6p3PgoqMUbBagDLjjVIlIN5B3bTUbMAUPJWajCW
 ArzMkcwGRFp36530xJAiJEqgvlaXUcZU+mjt7kWMoJGAugCe/ZBQDUB0GFkGJrDJ42bZUjTfe
 oF8OylK6KApUXSyO1MmnW/avPXr/0jjkSGKkiN0gx10rFvHkgXxBUfrCubTmz7cpRqG69piNo
 to+zaTVB1F+1kFtk3lriFiuM3Ly/OTkxXO+Htbhd7FI0MhwkCd5o4EWmygSSZcOgDt7U2jPcq
 pjE2dEiRTMbL6sE5snftrqNR+4JylCE7xdqjAhq61fJ4A3NWTigWBswEtXRvwx3kVMdC93aYe
 JNvFMa6EG6nWtAedbr3VbCboEHqSGlg9+u1plKtVvAjHytQXjiqsi7FHHiI0++R2kCuGaiuIq
 jDIXooLkMM/8dELVOu0mQji5Bpm43o4+s3RZAwbpBYIzyY0AGvK8mH40DqroSPHOrkIUM1Wol
 DhT2/hXgfD3efQgUdsXLUsHlV3Qo/I7BTL9eWknpuOYNBEPyJDXc/OZ9ARCxQqQncUx1oevVj
 PbIXv1JK5FV+z2HWOYyopSD31UPQwxiOjggER2Z0+MIc4K7I8s3yl6fweN+xwJ4h0CMammR7w
 /zIQlOvENpgYa0MzsTXiyQiMubah4hlrKhnfhMlc=

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 19 Nov 2026 16:56:09 +0100

Reuse existing functionality from devm_clk_get_optional_enabled()
instead of keeping duplicate source code.

The source code was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/dma/dw/platform.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/dma/dw/platform.c b/drivers/dma/dw/platform.c
index 7e76391475ac..9bb3c2cd0857 100644
=2D-- a/drivers/dma/dw/platform.c
+++ b/drivers/dma/dw/platform.c
@@ -64,12 +64,9 @@ static int dw_probe(struct platform_device *pdev)
=20
 	data->chip =3D chip;
=20
-	chip->clk =3D devm_clk_get_optional(chip->dev, "hclk");
+	chip->clk =3D devm_clk_get_optional_enabled(chip->dev, "hclk");
 	if (IS_ERR(chip->clk))
 		return PTR_ERR(chip->clk);
-	ret =3D clk_prepare_enable(chip->clk);
-	if (ret)
-		return ret;
=20
 	pm_runtime_enable(&pdev->dev);
=20
=2D-=20
2.56.1

